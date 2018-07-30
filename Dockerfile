FROM jenkins/jenkins:lts 

USER root
RUN apt-get update \  
      && apt-get install -y sudo \
      && apt-get install curl \
      && curl -sL https://deb.nodesource.com/setup_8.x | bash \
      && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
      && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
      && apt-get update \
      && apt-get install --no-install-recommends yarn \
      && apt-get install -y libltdl7 \
      && apt-get install nodejs \
      && apt-get -y install build-essential \
      && apt-get -y install golang-go \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
