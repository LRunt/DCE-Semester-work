@echo off
setlocal
echo Starting...

:: Controls if the minikube is running
minikube status >nul 2>&1
if %errorlevel% neq 0 (
    echo Starting Minikube...
    minikube start
)
minikube addons enable ingress

:: Connect to Minikube Docker daemon
echo Connecting terminal to Docker in Minikube...
@FOR /f "tokens=*" %%i IN ('minikube -p minikube docker-env --shell cmd') DO @%%i

:: Build images (make sure the names match your YAML files)
echo Building Docker images...
docker build -t lrunt/backend:v1 -f backend/Dockerfile.backend ./backend
docker build -t lrunt/frontend:v1 -f frontend/Dockerfile.frontend ./frontend

:: Deploy using Kustomize
echo Deploying the complete application using Kustomize...
kubectl apply -k k8s/ --load-restrictor LoadRestrictionsNone
kubectl get pods
pause