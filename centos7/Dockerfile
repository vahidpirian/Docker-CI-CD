FROM centos:7

##########################################################
## THIS IS A IMAGE FOR CREATE HOST TO DEPLOYING THE APP ##
##########################################################

MAINTAINER "VahidPirian"

RUN yum install -y openssh-clients openssh-server

# CREATE A NEW USER
RUN useradd jenkins && \
    echo "jenkins" | passwd jenkins --stdin && \
    mkdir /home/jenkins/.ssh && \
    chmod 700 /home/jenkins/.ssh 

# COPY PUBLIC KEY IN IMAGE
COPY jenkins-key.pub /home/jenkins/.ssh/authorized_keys

RUN chown jenkins:jenkins -R /home/jenkins/.ssh && \
    chmod 600 /home/jenkins/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

# INSTALL DOCKER
RUN yum update -y && \
    yum install -y yum-utils && \
    yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce docker-ce-cli containerd.io

# INSTALL DOCKER COMPOSE
RUN  curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
     chmod +x /usr/local/bin/docker-compose && \
     ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

RUN usermod -aG docker jenkins

CMD /usr/sbin/sshd -D
