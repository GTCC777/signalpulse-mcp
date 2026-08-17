# SignalPulse MCP Server

**Hosted MCP server** for market intelligence with a public, machine-graded track record —
FX, crypto, futures, options, equities, sports, racing, and prediction markets.

- **Endpoint:** `https://signalpulse.theaslangroupllc.com/api/mcp`
- **Transport:** Streamable HTTP (stateless, POST JSON-RPC 2.0 — no session, no SSE required)
- **Auth:** none required for free tools. Paid tools take an `X-API-KEY` header (credit packs)
  **or** per-call [x402](https://x402.org) USDC micropayments on Base — fully agent-native,
  no signup needed.

## Why this one

Most market MCP servers are free data plumbing. SignalPulse sells **graded calls**: every paid
tool returns either the single highest-probability trade call for a market or a full analyst
report — and the engine's history is public and machine-graded (R-multiple ROI, win rate,
calibration buckets) via the free `track_record` tool, so an agent can verify performance
before spending anything.

## Tools (46+)

**Free (no auth):**

| tool | what it returns |
|---|---|
| `track_record` | the public verifiable record: graded picks, win rate, R-multiple ROI, calibration |
| `leaderboard` | every desk's machine-graded record, daily/weekly/monthly |
| `instruments` | discovery: all instruments, sports, categories + per-tool parameter docs |
| `scan_sample` | pick-of-the-day: a full-depth free sample of the sports engine |
| `quote` | **cost preview for any tool + your remaining balance — never deducts** |

**Paid (1 credit or x402 per call):** `analysis` (any natural-language market question →
analyst report) plus scanners/signal desks: `scan_forex`, `scan_market`, `scan_crypto`,
`scan_futures`, `scan_options`, `scan_event`, `scan_predmarket`, `scan_game`,
`signal_sports`, `signal_polymarket`, `signal_racing`, `signal_golf`, `signal_equities`,
`signal_weather`, `signal_screener`, and more — call `instruments` for the full roster.

Every paid tool declares its cost in the description **and** machine-readably in
`_meta["signalpulse/cost"]` (credits, credit type, USD range), and the free `quote` tool
previews cost + balance first — an agent never discovers pricing by losing a credit.
Spec-safe: notification-form `tools/call` is never executed (no silent credit burn).

## Connect

Claude Desktop / any streamable-HTTP client:

```json
{
  "mcpServers": {
    "signalpulse": {
      "url": "https://signalpulse.theaslangroupllc.com/api/mcp",
      "headers": { "X-API-KEY": "sp_YOURKEY" }
    }
  }
}
```

Works without the header too: free tools respond, paid tools return a structured x402 402
payment envelope (pay USDC out-of-band at the resource URL, then retry, or buy a credit pack).

## Pricing

Credits are sold in packs (Stripe or crypto): analysis $1.00–$1.49/credit, signals
$1.70–$2.49/credit by pack size. x402 per-call prices ride the 402 envelope. Full details:
[llms.txt](https://signalpulse.theaslangroupllc.com/llms.txt).

## Notes

- Responses are market commentary/education with a canonical risk disclaimer — not financial
  advice. Trade at your own risk.
- This repo is the documentation surface for the hosted server; the engine itself is
  closed-source.
