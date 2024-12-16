FROM jenkins/jenkins:latest

# Install tools
USER root
RUN apt-get update && apt-get install -y \
    git \
    maven \
    openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

# Install Docker inside Jenkins container
RUN apt-get update && apt-get install -y \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

# Install Jenkins plugins
USER jenkins

ENV JENKINS_UC https://updates.jenkins.io

RUN jenkins-plugin-cli --plugins \
    workflow-aggregator \
    git \
    junit \
    cucumber-reports \
    maven-plugin \
    pipeline-utility-steps

