#!/bin/bash
# gpu.sh - Output GPU utilization with class for waybar styling
# Classes: (none) (<60%), warning (60-79%), high (80-94%), critical (>=95%)

usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null | tr -d ' ')

# Handle error case
if [[ -z "$usage" || ! "$usage" =~ ^[0-9]+$ ]]; then
    echo '{"text": "N/A", "class": "", "tooltip": "GPU unavailable"}'
    exit 0
fi

# Determine class based on thresholds
if [[ $usage -lt 60 ]]; then
    class=""
elif [[ $usage -lt 80 ]]; then
    class="warning"
elif [[ $usage -lt 95 ]]; then
    class="high"
else
    class="critical"
fi

echo "{\"text\": \"${usage}%\", \"class\": \"$class\", \"tooltip\": \"GPU: ${usage}%\"}"
