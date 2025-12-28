#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_BIN="$("${ROOT_DIR}/scripts/setup_terraform_github.sh")"

cd "${ROOT_DIR}"

"${TF_BIN}" init
"${TF_BIN}" apply
