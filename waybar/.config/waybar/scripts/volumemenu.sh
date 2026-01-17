#!/usr/bin/env bash

set -euo pipefail

ROFI=/usr/bin/rofi
WPCTL=/usr/bin/wpctl

# Toggle: if rofi is already running, kill it and exit
if pgrep -x rofi > /dev/null; then
    pkill -x rofi
    exit 0
fi

"$WPCTL" status >/dev/null 2>&1 || exit 0

# Parse section (Sinks or Sources) from wpctl status
# Returns: id<TAB>name<TAB>is_default (1 or 0)
# Only captures actual sink/source entries (with [vol:...])
section_list() {
  local section="$1" # "Sinks" or "Sources"
  "$WPCTL" status | awk -v section="$section" '
    # Match section header like "├─ Sinks:" or "├─ Sources:"
    $0 ~ ("─ " section ":") { insec=1; next }
    # Exit on next section header or empty section line
    insec && /─ [A-Za-z]+:/ { exit }
    insec && /^[[:space:]│]*$/ { exit }
    # Only match lines with [vol:...] - these are actual sinks/sources
    insec && /\[vol:/ {
      # Check for default marker (asterisk)
      is_default = ($0 ~ /\*/) ? 1 : 0
      # Extract ID and name
      if (match($0, /\*?[[:space:]]*([0-9]+)\.[[:space:]]+(.+)[[:space:]]+\[vol:/, a)) {
        name = a[2]
        # Trim trailing whitespace
        gsub(/[[:space:]]+$/, "", name)
        print a[1] "\t" name "\t" is_default
      }
    }'
}

sinks="$(section_list "Sinks")"
sources="$(section_list "Sources")"

# Build parallel arrays: ids and display names
declare -a ids=()
declare -a names=()
declare -a header_indices=()

# Add output section header (index 0)
ids+=("")
names+=("Output")
header_indices+=(0)

# Add sinks (outputs)
while IFS=$'\t' read -r id name is_default; do
  [ -z "$id" ] && continue
  ids+=("$id")
  if [ "$is_default" = "1" ]; then
    prefix="✓"
  else
    prefix="○"
  fi
  names+=("${prefix}  ${name}")
done <<< "$sinks"

# Add input section header
input_header_index=${#names[@]}
ids+=("")
names+=("Input")
header_indices+=("$input_header_index")

# Add sources (inputs)
while IFS=$'\t' read -r id name is_default; do
  [ -z "$id" ] && continue
  ids+=("$id")
  if [ "$is_default" = "1" ]; then
    prefix="✓"
  else
    prefix="○"
  fi
  names+=("${prefix}  ${name}")
done <<< "$sources"

# Build comma-separated list of header indices for rofi -a flag
active_rows=$(IFS=,; echo "${header_indices[*]}")

# Build display list for rofi
menu_display=""
for name in "${names[@]}"; do
  menu_display+="${name}"$'\n'
done
# Remove trailing newline
menu_display="${menu_display%$'\n'}"

# Count entries for dynamic lines
entry_count=${#names[@]}

# Show rofi with nord theme, override only window position for waybar dropdown
selected_index=$("$ROFI" -dmenu -i \
    -p "" \
    -no-custom \
    -a "$active_rows" \
    -format 'i' \
    -selected-row 1 \
    -me-select-entry '' \
    -me-accept-entry 'MousePrimary' \
    -theme-str '
      window { 
        location: northeast; 
        anchor: northeast;
        x-offset: -5px;
        y-offset: 3px;
        width: 380px; 
        border-radius: 6px;
        border: 1px;
        border-color: #5e81ac;
        padding: 0;
      }
      mainbox {
        padding: 0;
      }
      inputbar { enabled: false; }
      listview { 
        lines: '"${entry_count}"';
        border: 0;
        padding: 8px;
        border-radius: 6px;
      }
      element normal.active, element alternate.active { 
        background-color: #434C5E;
        text-color: #D8DEE9;
      }
    ' \
    <<< "$menu_display") || exit 0

# Get the ID for the selected index
selected_id="${ids[$selected_index]:-}"

# Validate it's a number (not separator)
[[ "${selected_id:-}" =~ ^[0-9]+$ ]] || exit 0

# Set as default
"$WPCTL" set-default "$selected_id"
