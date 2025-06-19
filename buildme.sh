#!/bin/bash
set -e

app="mcp-server-agent-list-service"
version="latest"

docker build -t $app:$version .

