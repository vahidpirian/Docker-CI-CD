FROM jenkins/jenkins

USER root

MAINTAINER 'vahidpirian'

# Install Ansible

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python get-pip.py && \
    pip install ansible

# Install Docker

RUN apt-get update && \
    apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable" && \
    apt-get update && \
    apt-get install -y docker-ce

# Install docker-compose
RUN  curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-comp      se-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
     chmod +x /usr/local/bin/docker-compose && \
     ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins
