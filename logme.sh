#!/bin/bash
set -e

app="mcp-server-agent-list-service"
version="latest"

# Optional: map a persistent data directory if you add persistence later
docker logs -f  mcpsa-list-service-instance 

