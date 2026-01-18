#!/bin/bash
# systemdrawer.sh - Output system status tooltip for waybar
# Shows CPU and GPU usage in tooltip

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

# Output JSON for waybar
echo "{\"text\": \"\", \"tooltip\": \"CPU: ${cpu_usage}%\\nGPU: ${gpu_usage}%\"}"
