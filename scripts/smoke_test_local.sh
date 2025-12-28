#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

export PATH="${ROOT_DIR}/bin:${PATH}"

terraform init -backend=false -input=false
terraform validate
