FROM jenkins/jenkins:lts
# FROM jenkins:2.19.4
USER root

RUN apt-get update \
      && apt-get install -y \
         apt-transport-https \
         ca-certificates \
         curl \
         gnupg-agent \
         software-properties-common \
         sudo \
      && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
      && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
      && apt-get update \
      && apt-get install -y docker-ce \
      && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose; chmod +x /usr/local/bin/docker-compose

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli --plugins $(cat /usr/share/jenkins/plugins.txt)


