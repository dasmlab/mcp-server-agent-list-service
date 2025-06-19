# MCP Server Agent List Service

A minimal FastAPI microservice that manages and exposes a queue of MCP Server Agents, supporting both on-prem and cloud deployment actions. Designed for Kubernetes-native environments (with MetalLB support).

This project implements CircleCI Workflow and is connected to both a K8s Container-Agent Resource Class and a Docker-in-Docker Extended CircleCI instance. Allowing us to do docker'ish stuff and K8s stuff in our workflow/pipeline at the same time via the Resource_classes (dasmlab/default, and dasmlab/docker). 

Instalation scripts for both can be found at https://github.com/lmcdasm/oneshots/install-circle-ci-runner

---

## Framework

- **API:** Python (FastAPI) for quick, async API serving
- **Deployment:** Containerized, with Kubernetes Deployment and Service (using MetalLB for LoadBalancer IPs)

---

## Scope & Data Model

This service maintains a "server" (queue) of MCP Server Agents.  
It provides a REST API for listing, adding, deleting, and retrieving details of known MCP Server Agents. Each agent is represented as:

```json
{
  "id": "<uuid>",
  "name": "<Provider Name>",
  "description": "<Short description of the MCP Server Agent>",
  "actions": [
    "Link Only",              // Only provides homepage/link
    "Deploy OnPrem",          // Deploy on on-prem infra (Docker, K8s, etc.)
    "Deploy InCloud",         // Deploy in cloud with proper inputs
    "Deploy With MCP Explorer" // Instrument/connect via MCP Explorer Application
  ]
}
```

All responses are wrapped in a top-level key:
{"mcp_server_agents": [ ... ]}

#API Endpoints

Method	Endpoint	        Description
GET	    /servers	        List all MCP Server Agents (the queue/carousel)
POST	/servers	        Add a new MCP Server Agent (returns UUID)
DELETE	/servers?id=<uuid>	Delete a MCP Server Agent by UUID
GET	    /servers?id=<uuid>	Retrieve info for a specific MCP Server Agent

# Planned Action Endpoints:

POST /action/:id/deploy-in-cloud  — Deploy in cloud (with payload)

POST /action/:id/deploy-in-explorer  — Instrument with MCP Explorer, etc.

## Usage Examples
### List all server agents
curl http://host:port/servers

### Add a new agent
curl -X POST http://host:port/servers \
     -H 'Content-Type: application/json' \
     -d '{"name": "Acme Cloud", "description": "Provides test env", "actions": ["Deploy InCloud", "Link Only"]}'

### Delete an agent
curl -X DELETE "http://host:port/servers?id=<uuid>"

### Get a specific agent
curl http://host:port/servers?id=<uuid>

# Deployment

Containerize with your favorite image builder.

Deploy as a Kubernetes Deployment + Service.

Use LoadBalancer Service (MetalLB recommended for bare metal setups).

Configure your API endpoints as described above.

# Roadmap

Implement action endpoints for "deploy-in-cloud" and "deploy-in-explorer"

Support multiple agent discovery sources

Optional: add authentication and more detailed status reporting

# License
See [LICENSE.md](./LICENSE.md)
