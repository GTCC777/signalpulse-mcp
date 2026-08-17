# Boots a stdio bridge to the hosted SignalPulse MCP endpoint so registry
# checkers (Glama) can start the server and run introspection (tools/list).
# The bridge is mcp-remote (https://www.npmjs.com/package/mcp-remote).
FROM node:20-slim
RUN npm install -g mcp-remote@latest
ENTRYPOINT ["mcp-remote", "https://signalpulse.theaslangroupllc.com/api/mcp"]
