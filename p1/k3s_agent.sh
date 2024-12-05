#!/bin/bash
set -e

echo "Waiting for the token file from the controller..."
# Wait for the token file to appear
while [ ! -f /vagrant/node-token ]; do
  echo "Token file not found. Retrying in 5 seconds..."
  sleep 5
done

K3S_SERVER_IP="192.168.56.110"
NODE_TOKEN=$(cat /vagrant/node-token)

echo "Token fetched successfully: $NODE_TOKEN"

echo "Installing k3s agent..."
sudo apt-get update -y
sudo apt-get install -y curl
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent" K3S_URL="https://${K3S_SERVER_IP}:6443" K3S_TOKEN="$NODE_TOKEN" sh -

echo "k3s agent setup complete. Verifying connection to the controller..."
sudo k3s kubectl get nodes


# #!/bin/bash
# set -e

# chmod 700 /home/vagrant/.ssh
# chmod 600 /home/vagrant/.ssh/authorized_keys
# sudo systemctl restart sshd

# K3S_SERVER_IP="192.168.56.110"
# SSH_USER="aelasriS"
# NODE_TOKEN_FILE="/var/lib/rancher/k3s/server/node-token"

# echo "Fetching node token from the server at $K3S_SERVER_IP..."

# NODE_TOKEN=$(sudo ssh -o StrictHostKeyChecking=no ${SSH_USER}@${K3S_SERVER_IP} "sudo cat ${NODE_TOKEN_FILE}")

# if [ -z "$NODE_TOKEN" ]; then
#     echo "Error: Failed to retrieve the node token from the server."
#     exit 1
# fi

# echo "Node token fetched successfully."

# echo "Installing k3s agent..."

# sudo apt-get update -y
# sudo apt-get install -y curl
# curl -sfL https://get.k3s.io | K3S_URL="https://${K3S_SERVER_IP}:6443" K3S_TOKEN="${NODE_TOKEN}" sh -

# echo "k3s agent installation complete. Verifying connection..."
# sudo k3s-agent kubectl get nodes
