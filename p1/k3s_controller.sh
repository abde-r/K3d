# #!/bin/bash
# set -e

# echo "Installing k3s in controller mode..."
# sudo apt-get update -y
# sudo apt-get install -y curl
# curl -sfL https://get.k3s.io | sh -

# echo "Fetching token..."
# sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/node-token

# echo "Controller setup complete."


#!/bin/bash
set -e

K3S_INSTALL_URL="https://get.k3s.io"
KUBECONFIG_MODE=644

echo "Installing k3s in controller mode..."

sudo apt-get update -y
sudo apt-get install -y curl

curl -sfL $K3S_INSTALL_URL | sh -s - server --write-kubeconfig-mode $KUBECONFIG_MODE

echo "k3s server installed successfully. Verifying installation..."
sudo k3s kubectl get nodes

sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/node-token

echo "Installation complete. Use the above token to connect agents."
