from fastapi import FastAPI, HTTPException, Query
from models import MCPServerAgent
from typing import List, Optional
import uuid


# Declare the APP
app = FastAPI(
        title="MCP Server Agent List Service",
        description="Provides a carousel/queue of MCP Server Agents with CRUD Operations"
    )

# In-Memory store for agents
agents: List[MCPServerAgent] = []


## DECLARE OUR API ROUTES
# get the servers list, or optionally, if ?id=xxx is passed, return just the one 
@app.get("/servers")
def list_servers(id: Optional[str] = Query(None)):
    if id:
        for agent in agents:
            if agent.id == id:
                return {"mcp_server_agents": [agent]}
        raise HTTPException(status_code=404, detail="Agent not found")
    return {"mcp_server_agents": agents}

@app.post("/servers")
def add_server(agent: MCPServerAgent):
    agent.id = str(uuid.uuid4())
    agents.append(agent)
    return {"id": agent.id}

@app.delete("/servers")
def delete_server(id: str = Query(...)):
    for i, agent in enumerate(agents):
        if agent.id == id:
            del agents[i]
            return {"status": "deleted"}
    raise HTTPException(status_code=404, detail="MCP Server Agent not found with that ID")


@app.get("/isalive")
def isalive():
    return {"status", "alive"}

