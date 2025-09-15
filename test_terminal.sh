#!/bin/bash
# remember to use raw link or it will not fetch from github
# this simply grabs one quote at a time for testing

# URL of the JSON file on GitHub
JSON_URL="https://raw.githubusercontent.com/1nam/fetch_quotes/refs/heads/main/you_can_do_it.json"

# Download the JSON file once
QUOTES=$(curl -s $JSON_URL)

# Count the number of quotes
NUM_QUOTES=$(echo "$QUOTES" | jq length)

while true; do
    # Prompt user
    read -p "Press Enter for a new quote or 'q' to quit: " input

    if [[ "$input" == "q" ]]; then
        echo "Goodbye!"
        break
    fi

    # Pick a random index
    INDEX=$((RANDOM % NUM_QUOTES))

    # Print the quote
    echo ""
    echo "$QUOTES" | jq -r ".[$INDEX]"
    echo ""
done
