
#!/bin/bash

# Execute on ALL of your Worker Nodes

#  Perform pre-flight checks and reset the node:
sudo kubeadm reset -f

# Paste the join command you got from the master node and append --v=5 at the end:
# Example:
# sudo kubeadm join <control-plane-ip>:6443 --token <token> \
# --discovery-token-ca-cert-hash sha256:<hash> \
# --cri-socket "unix:///run/containerd/containerd.sock" --v=5
