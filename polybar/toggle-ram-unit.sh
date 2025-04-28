#!/bin/bash

# Path to store the current unit state (GiB or MiB)
state_file="$HOME/.cache/polybar/ram_unit_state"

# Check if the state file exists, if not create it with the default unit "GiB"
if [ ! -f "$state_file" ]; then
    echo "GiB" > "$state_file"
fi

# Read the current unit state
current_unit=$(cat "$state_file")

# Toggle the unit between GiB and MiB
if [ "$current_unit" == "GiB" ]; then
    echo "MiB" > "$state_file"
else
    echo "GiB" > "$state_file"
fi

