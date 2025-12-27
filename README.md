# DCE-Semester-work

This repository contains the source code and deployment configurations for a personal website application. The project demonstrates a full-stack architecture deployed using various DevOps methodologies: Docker Compose, Infrastructure as Code (Terraform/Ansible), and Kubernetes.

## Repository structure
The solution is divided into three specific branches, each representing a different stage of deployment:
- Main = The base source code and local development setup using Docker Compose.
- IaC-Terraform-Ansible = automation for provisioning infrastructure on OpenNebula and deploying the application using Terraform and Ansible.
- Kubernetes = Orchestration manifests for running the application in a Kubernetes cluster.

## Configuration

**Important**: Before running the application in any branch, you must configure the environment variables for database and persistent data dir.

## Description of program
The application is a 3-tier web architecture consisting of a Vue.js frontend, a Python FastAPI backend, and a PostgreSQL database.

The website consists of three main pages:
* **Main Page (`index.html`)**: Static content; does not utilize the backend.
* **Results**: Loads dynamic data from the backend endpoint `/results`.
* **Projects**: Loads dynamic data from the backend endpoint `/projects`.
    * Supports a query parameter for language: `?lang=cs` or `?lang=en`.

## Main branch
The main branch is designed for quick local deployment using Docker Compose.

### Prerequisities
- Docker

### How to run
```sh
docker-compose up --build -d
```

Application will be accessable on port http://localhost:8080.

## Iac-Terraform-Ansible branch
This branch creates a Virtual Machine on ZCU OpenNebula using Terraform and subsequently configures the environment and deploys the application using Ansible.

### Workflow
* **Terraform**: Creates a virtual machine on ZCU OpenNebula.
* **Ansible**: Provisions the VM, installs Docker, copies the code from the `main` branch, and runs the application via Docker Compose.

### Prerequisites
- Docker
- Account on OpenNebula (Orion login ZČU)

### How to run
Initialize Terraform: Navigate to the .devcontainer (or your terraform directory) and initialize the providers:
```sh
terraform init
```
Apply Configuration: Run the plan and apply commands. You will need to provide your OpenNebula credentials if they are not saved in `tfvars`.
```sh
terraform apply
```
type `yes` when prompted to confirm.

This command will create VM and install application.

## Kubernetes
This solution orchestrates the application containers within a Kubernetes cluster.

### Prerequisites
- Running Kubernetes cluster (I'm running in Docker)
- Docker
- `kubectl` CLI tool configured

### How to run
1) Ensure that you are running the docker
2) Create docker containers
In root of project run commands:
```sh
docker build -t lrunt/backend:v1 -f backend/Dockerfile.backend ./backend
docker build -t lrunt/frontend:v1 -f frontend/Dockerfile.frontend ./frontend
```
3) Apply configuration files with commad:
```sh
kubectl apply -k .
```
4) Verify if the application is running:
```sh
kubectl get pods
kubectl get services
```

Application can be opened on localhost.