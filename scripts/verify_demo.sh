#!/usr/bin/env bash
# Verificación mínima para demo hackathon InnerOS Alexa → Cursor (ops_cb0920d55874)
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

OPS_TASK="ops_cb0920d55874"
FAIL=0

pass() { echo "OK  $*"; }
fail() { echo "FAIL $*"; FAIL=1; }

grep -q "$OPS_TASK" README.md && pass "README menciona $OPS_TASK" || fail "README sin ops task"

[[ -f demo/hackathon_verification.json ]] && pass "demo/hackathon_verification.json" || fail "falta demo artifact"

[[ -f verification/${OPS_TASK}.evidence.json ]] && pass "evidence JSON" || fail "falta evidence"

grep -q "\"ops_task\": \"$OPS_TASK\"" demo/hackathon_verification.json && \
  pass "demo JSON ops_task" || fail "demo JSON ops_task incorrecto"

grep -q "composer-2.5-fast" verification/${OPS_TASK}.evidence.json && \
  pass "modelo en evidence" || fail "evidence sin modelo"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  pass "repositorio git ($(git rev-parse --short HEAD))"
else
  fail "no es un repositorio git"
fi

if [[ "$FAIL" -eq 0 ]]; then
  echo ""
  echo "VERIFICACIÓN HACKATHON: PASSED ($OPS_TASK)"
  exit 0
fi

echo ""
echo "VERIFICACIÓN HACKATHON: FAILED ($OPS_TASK)"
exit 1
