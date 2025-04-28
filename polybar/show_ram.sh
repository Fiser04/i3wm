#!/bin/bash

# Path to the state file
state_file="$HOME/.cache/polybar/ram_unit_state"

# If the state file doesn't exist, default to GiB
if [ ! -f "$state_file" ]; then
    echo "GiB" > "$state_file"
fi

# Get the current unit from the state file
unit=$(cat "$state_file")

# Get RAM usage in MiB and GiB
total_mem=$(free -m | awk '/Mem:/ {print $2}')  # Total RAM in MiB
used_mem=$(free -m | awk '/Mem:/ {print $3}')   # Used RAM in MiB

if [ "$unit" == "GiB" ]; then
    total_mem=$(echo "$total_mem / 1024" | bc -l)  # Convert to GiB
    used_mem=$(echo "$used_mem / 1024" | bc -l)    # Convert to GiB
    # Format the output with GiB
    echo "$(printf '%.2f' $used_mem)/$(printf '%.2f' $total_mem) GiB"
else
    # Format the output with MiB
    echo "$used_mem/$total_mem MiB"
fi

