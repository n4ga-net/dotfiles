#!/bin/bash
# systemdrawer.sh - Output CPU usage class for waybar styling
# Classes: low (<60%), medium (60-74%), high (75-96%), critical (>=97%)

# Read CPU stats
read -r cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat

# Calculate total and idle
prev_total=0
prev_idle=0

# Store previous values in temp file for delta calculation
state_file="/tmp/waybar_cpu_state"

if [[ -f "$state_file" ]]; then
    read -r prev_total prev_idle < "$state_file"
fi

# Current totals
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle_total=$((idle + iowait))

# Save current state
echo "$total $idle_total" > "$state_file"

# Calculate deltas
total_delta=$((total - prev_total))
idle_delta=$((idle_total - prev_idle))

# Calculate CPU usage percentage
if [[ $total_delta -gt 0 ]]; then
    usage=$(( (total_delta - idle_delta) * 100 / total_delta ))
else
    usage=0
fi

# Determine class based on thresholds
if [[ $usage -lt 60 ]]; then
    class="low"
elif [[ $usage -lt 75 ]]; then
    class="medium"
elif [[ $usage -lt 97 ]]; then
    class="high"
else
    class="critical"
fi

# Output JSON for waybar (text is empty, icon is in format config)
echo "{\"text\": \"\", \"class\": \"$class\", \"tooltip\": \"CPU: ${usage}%\"}"
