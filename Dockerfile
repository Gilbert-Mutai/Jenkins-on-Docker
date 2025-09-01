FROM jenkins/jenkins:lts-jdk21

USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y lsb-release ca-certificates curl && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
    https://download.docker.com/linux/debian $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" \
    | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && apt-get install -y docker-ce-cli \
    python3 python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add Jenkins to docker group (optional: needed if you mount /var/run/docker.sock)
RUN groupadd -f docker && usermod -aG docker jenkins

USER jenkins

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins \
  "blueocean docker-workflow cloudbees-folder"
