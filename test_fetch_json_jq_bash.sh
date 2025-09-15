#!/bin/bash

curl -s 'https://raw.githubusercontent.com/1nam/fetch_quotes/refs/heads/main/quotes.json' | jq '.'
