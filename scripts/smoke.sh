#!/usr/bin/env bash
# Watch the core loop: hit the API health endpoint and assert it is up.
set -euo pipefail

API_URL="${API_URL:-http://localhost:3000}"

echo "→ GET ${API_URL}/health"
curl -fsS "${API_URL}/health"
echo
echo "✓ API is healthy"
