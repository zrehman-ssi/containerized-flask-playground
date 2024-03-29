FROM jenkins/jenkins

USER root

#Install docker client binaries
RUN apt-get update && apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && apt-get update && apt-get -y install docker-ce

#Install python
RUN apt update && apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget && wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz && tar -xf Python-3.7.4.tar.xz && cd Python-3.7.4 && ./configure && make altinstall
