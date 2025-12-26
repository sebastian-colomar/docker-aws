sudo apt update
sudo apt upgrade -y
sudo apt install docker.io -y
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo apt-get install ./minikube_latest_amd64.deb -y
sudo minikube start --driver=docker
