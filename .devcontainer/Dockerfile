FROM ubuntu:20.04

ARG WORKSPACE_DIR=/workspace
ARG PERSISTENT_DATA_DIR=/var/iac-dev-container-data
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install prerequisites
RUN apt-get update && apt-get install -y \
    gnupg \
    software-properties-common \
    ca-certificates \
    curl \
    lsb-release \
    apt-transport-https \
    git \
    python3-dev \
    python3-pip \
    python3-venv \
    python3-virtualenv \
    && mkdir -p /etc/apt/keyrings

# 2. Add HashiCorp Repo (Using the modern 'GPG dearmor' method)
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list

# 3. Add NodeJS Repo
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" > /etc/apt/sources.list.d/nodesource.list

# 4. Install Tools (Single layer for efficiency)
RUN apt-get update && apt-get install -y \
    terraform \
    nodejs \
    && npm install --global cdktf-cli@latest

# 5. Python Libraries & Ansible
RUN pip3 install --no-cache-dir docker ansible \
    && ansible-galaxy collection install community.docker

# 6. Setup Script and Environment
COPY init-iac-dev.sh /etc/init-iac-dev.sh
RUN chmod +x /etc/init-iac-dev.sh \
    && echo '. /etc/init-iac-dev.sh' >> /root/.bashrc \
    && echo 'export TF_VAR_vm_ssh_pubkey="`cat ${PERSISTENT_DATA_DIR}/id_ecdsa.pub 2>/dev/null`"' >> /root/.bashrc

WORKDIR ${WORKSPACE_DIR}
VOLUME ${WORKSPACE_DIR} ${PERSISTENT_DATA_DIR}
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV PERSISTENT_DATA_DIR=${PERSISTENT_DATA_DIR}
ENV SHELL=/bin/bash
ENV ANSIBLE_HOST_KEY_CHECKING=False

CMD [ "sleep", "infinity" ]