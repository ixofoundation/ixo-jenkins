#!/bin/sh
docker build -t trustlab/ixo-ci-jenkins .
docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -v jenkins_home:/var/jenkins_home -p 80:8080 -p 50000:50000 --name ixo-jenkins trustlab/ixo-ci-jenkins
