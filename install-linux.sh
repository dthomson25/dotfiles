set -ex

git

# Install package managers and basic tools
sudo apt update && sudo apt upgrade -y

# Install common development tools
sudo apt install -y \
    curl \
    wget \
    git \
    tree \
    watch \
    jq \
    fzf \
    python3-pip

# Install thefuck
sudo apt-get install -y thefuck

# Install zsh and plugins
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install Docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Install Kubernetes tools
ARCH=$(uname -m)
case $ARCH in
    x86_64)
        KUBECTL_ARCH="amd64"
        ;;
    aarch64)
        KUBECTL_ARCH="arm64"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${KUBECTL_ARCH}/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Install Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-$ARCH
sudo install -o root -g root -m 0755 kind /usr/local/bin/kind
rm kind

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-$ARCH
sudo install minikube-linux-$ARCH /usr/local/bin/minikube
rm minikube-linux-$ARCH

# Install Go
sudo apt install -y golang-go

# Install Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y
