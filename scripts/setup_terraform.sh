#!/usr/bin/env bash
set -euo pipefail

TF_VERSION="1.6.6"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOOLS_DIR="${ROOT_DIR}/.tools/terraform/${TF_VERSION}"
BIN_PATH="${TOOLS_DIR}/terraform"

if [[ -x "${BIN_PATH}" ]]; then
  echo "Terraform ${TF_VERSION} already installed at ${BIN_PATH}"
  echo "${BIN_PATH}"
  exit 0
fi

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
case "${ARCH}" in
  x86_64|amd64) ARCH="amd64" ;;
  arm64|aarch64) ARCH="arm64" ;;
  *) echo "Unsupported architecture: ${ARCH}" >&2; exit 1 ;;
 esac

case "${OS}" in
  linux|darwin) : ;;
  *) echo "Unsupported OS: ${OS}" >&2; exit 1 ;;
 esac

ZIP_NAME="terraform_${TF_VERSION}_${OS}_${ARCH}.zip"
DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${TF_VERSION}/${ZIP_NAME}"

mkdir -p "${TOOLS_DIR}"

echo "Downloading Terraform ${TF_VERSION} from ${DOWNLOAD_URL}" >&2
curl -fsSL "${DOWNLOAD_URL}" -o "${TOOLS_DIR}/${ZIP_NAME}"

unzip -q "${TOOLS_DIR}/${ZIP_NAME}" -d "${TOOLS_DIR}"
chmod +x "${BIN_PATH}"

rm "${TOOLS_DIR}/${ZIP_NAME}"

echo "Terraform installed at ${BIN_PATH}"

echo "${BIN_PATH}"
