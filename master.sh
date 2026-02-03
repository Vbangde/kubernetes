
#!/bin/bash

# Execute ONLY on the "Master" Node

#  Initialize the Cluster
echo "Initializing Kubernetes Cluster..."
sudo kubeadm init

# Set Up Local kubeconfig
echo "Setting up local kubeconfig..."
mkdir -p "$HOME/.kube"
sudo cp -i /etc/kubernetes/admin.conf "$HOME/.kube/config"
sudo chown "$(id -u):$(id -g)" "$HOME/.kube/config"

#  Install a Network Plugin (Calico)
echo "Installing Calico network plugin..."
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/calico.yaml

#  Generate Join Command
echo "Generating join command for worker nodes..."
kubeadm token create --print-join-command

echo "Kubernetes Master Node setup complete."
