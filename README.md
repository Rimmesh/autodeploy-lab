# Reference API – CI/CD with Azure Container Registry

This project demonstrates a **modern CI/CD pipeline** for a **.NET 8 Web API**, fully containerized with Docker and integrated with **Azure Container Registry (ACR)** using **GitHub Actions**.

---

## 🧱 Tech Stack

- **Backend**: .NET 8 (ASP.NET Core Web API)
- **Containerization**: Docker
- **CI/CD**: GitHub Actions
- **Container Registry**: Azure Container Registry (ACR)
- **Cloud**: Microsoft Azure

---

## 📂 Project Structure

├── app/
│ └── ReferenceApi/
│ ├── ReferenceApi.csproj
│ ├── Dockerfile
│ └── ...
├── .github/
│ └── workflows/
│ └── ci.yml
└── README.md

---

## 🔄 CI Pipeline Overview

The CI pipeline is triggered on every push or pull request to the `main` branch.

### CI Steps:

1. Checkout source code
2. Setup .NET 8 SDK
3. Restore dependencies
4. Build the application
5. Run unit tests
6. Build Docker image
7. Authenticate to Azure Container Registry
8. Push Docker image to ACR

Each Docker image is tagged using the **Git commit SHA** to ensure traceability and easy rollback.

---

## 📦 Docker Image

- **Image name**: `reference-api`
- **Registry**: Azure Container Registry
- **Tag**: Git commit SHA

Example:
referenceacr123.azurecr.io/reference-api:<commit-sha>

---

## 🔐 Authentication Strategy

Due to Azure for Students tenant restrictions, **ACR Admin credentials** are used for CI authentication.

> ⚠️ In a production environment, this setup would be replaced by a **Service Principal with RBAC permissions**.

---

## 🚀 Next Steps

- Provision infrastructure using **Terraform**
- Deploy the container to **Azure App Service**
- Add a CD pipeline for automated deployment

---

## 👨‍💻 Author

Built as part of a **DevOps / Cloud CI-CD learning project** using Azure and GitHub Actions.
