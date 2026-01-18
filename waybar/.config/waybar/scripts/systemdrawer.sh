#!/bin/bash
# systemdrawer.sh - Output system status class for waybar styling
# Considers both CPU and GPU usage for the overall state
# Classes: low (<60%), medium (60-74%), high (75-96%), critical (>=97%)

# --- CPU Usage Calculation ---
read -r cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat

prev_total=0
prev_idle=0

state_file="/tmp/waybar_cpu_state"

if [[ -f "$state_file" ]]; then
    read -r prev_total prev_idle < "$state_file"
fi

total=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle_total=$((idle + iowait))

echo "$total $idle_total" > "$state_file"

total_delta=$((total - prev_total))
idle_delta=$((idle_total - prev_idle))

if [[ $total_delta -gt 0 ]]; then
    cpu_usage=$(( (total_delta - idle_delta) * 100 / total_delta ))
else
    cpu_usage=0
fi

# --- GPU Usage Calculation ---
gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null | tr -d ' ')
if [[ -z "$gpu_usage" || ! "$gpu_usage" =~ ^[0-9]+$ ]]; then
    gpu_usage=0
fi

# --- Determine class based on max of CPU and GPU ---
# CPU thresholds: 60/75/97, GPU thresholds: 60/80/95
# We'll use the higher severity between the two

get_severity() {
    local usage=$1
    local warn=$2
    local high=$3
    local crit=$4
    
    if [[ $usage -ge $crit ]]; then
        echo 3
    elif [[ $usage -ge $high ]]; then
        echo 2
    elif [[ $usage -ge $warn ]]; then
        echo 1
    else
        echo 0
    fi
}

cpu_severity=$(get_severity $cpu_usage 60 75 97)
gpu_severity=$(get_severity $gpu_usage 60 80 95)

# Use the maximum severity
if [[ $cpu_severity -ge $gpu_severity ]]; then
    max_severity=$cpu_severity
else
    max_severity=$gpu_severity
fi

# Map severity to class
case $max_severity in
    0) class="low" ;;
    1) class="medium" ;;
    2) class="high" ;;
    3) class="critical" ;;
esac

# Output JSON for waybar
echo "{\"text\": \"\", \"class\": \"$class\", \"tooltip\": \"CPU: ${cpu_usage}%\\nGPU: ${gpu_usage}%\"}"
