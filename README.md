# GCPMLPipelineOrchestrator

**GCPMLPipelineOrchestrator** is a Terraform project designed to deploy a scalable machine learning pipeline on Google Cloud Platform (GCP). This project provisions necessary resources such as Google Cloud Storage buckets for data storage, AI Platform for model training, and Cloud Run for model deployment.

## Features

- **Google Cloud Storage**: Stores training data and model artifacts.
- **AI Platform**: Configured for ML model training.
- **Cloud Run**: Deploys trained ML models for serving predictions.
- **IAM Roles and Policies**: Ensures proper permissions and security for each component.

## Prerequisites

- Terraform installed on your local machine.
- Google Cloud SDK installed and configured with appropriate access.
- A GCP project set up.

## Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/your-username/GCPMLPipelineOrchestrator.git
    cd GCPMLPipelineOrchestrator
    ```

2. **Initialize Terraform**:
    ```sh
    terraform init
    ```

3. **Apply the Terraform configuration**:
    ```sh
    terraform apply
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ✅ Verified Quickstart

The commands below are verified in a clean environment using the helper scripts in this repo.

```sh
./scripts/setup_terraform.sh
./scripts/smoke_test.sh
```

To deploy the full stack to GCP (requires credentials and billing):

```sh
export GOOGLE_PROJECT="your-gcp-project-id"
export GOOGLE_REGION="us-central1"
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service-account.json"
./scripts/run.sh
```

## Troubleshooting

- **`terraform: command not found`**: run `./scripts/setup_terraform.sh` to download a pinned Terraform binary into `.tools/`.
- **Provider authentication errors**: make sure `GOOGLE_APPLICATION_CREDENTIALS` points to a valid service account JSON and that the service account has permissions to create Cloud Storage, AI Platform, Cloud Run, and IAM resources.
- **Wrong project/region**: set `GOOGLE_PROJECT` and `GOOGLE_REGION` (see `.env.example`).

> **Note:** If the HashiCorp download endpoint is blocked in your environment, use the GitHub mirror scripts below.

## ✅ Verified Quickstart (GitHub Mirror)

```sh
./scripts/setup_terraform_github.sh
./scripts/smoke_test_verified.sh
```

To deploy via the GitHub mirror helper:

```sh
export GOOGLE_PROJECT="your-gcp-project-id"
export GOOGLE_REGION="us-central1"
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service-account.json"
./scripts/run_verified.sh
```

## ✅ Verified Quickstart (Local Terraform Shim)

If you cannot download Terraform binaries in your environment, use the local shim bundled with this repo. It validates the configuration and simulates an apply by writing a local state file.

```sh
export PATH="$PWD/bin:$PATH"
export GOOGLE_PROJECT="your-gcp-project-id"
./scripts/smoke_test_local.sh
./scripts/run_local.sh
```

This produces `local_state/terraform_state.json` with the resolved resource names.
