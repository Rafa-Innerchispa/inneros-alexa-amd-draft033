# InnerOS Alexa → Cursor E2E Demo

This repository was created by the Ambient Guardian / Inner Oz Alexa skill.

- Voice request: create a verification demo for the hackathon
- Ops task: `ops_cb0920d55874`
- Provider: Cursor
- Execution model: `composer-2.5-fast`
- Governance: owner authorization received through WhatsApp

Cursor should complete the requested minimal, reversible demo and leave verification evidence here.

## Demo de verificación (hackathon)

Pipeline probado de punta a punta: petición por voz → tarea ops → ejecución en Cursor en este worktree.

| Elemento | Ubicación |
|----------|-----------|
| Artefacto demo | `demo/hackathon_verification.json` |
| Evidencia | `verification/ops_cb0920d55874.evidence.json` |
| Comprobación | `./scripts/verify_demo.sh` |

### Ejecutar verificación

```bash
chmod +x scripts/verify_demo.sh
./scripts/verify_demo.sh
```

Salida esperada: `VERIFICACIÓN HACKATHON: PASSED (ops_cb0920d55874)`.

### Revertir la demo

Borrar `demo/`, `verification/`, `scripts/verify_demo.sh` y restaurar este bloque del README (o `git revert` del commit de la demo).
