#!/bin/bash
set -e

app="mcp-server-agent-list-service"
version="latest"

docker stop mcpsa-list-service-instance
docker rm mcpsa-list-service-instance
# Optional: map a persistent data directory if you add persistence later
docker run -d -p 8000:8000 --name mcpsa-list-service-instance $app:$version

