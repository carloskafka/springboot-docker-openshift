This is a repo to use as a quickstart to start working with Spring Boot and deploying to the WildFly application server.  This uses the mvn build system and creates a .war file that can be deployed.  The code also contains a sample REST based service listening at /hello.

As an added bonus, this repo can also be deployed directly as a docker container using the WildFly S2I builder image on OpenShift 3 with the following command:

	oc new-app wildfly:10.0~https://github.com/gshipley/bootwildfly.git


What, you don't have OpenShift 3 yet? Fix that immediately: www.openshift.org/vm

## Configuração do Jenkins

## Execução Jenkins

`docker run -u root --name jenkins -p 8080:8080 -p 50000:50000  -v /var/run/docker.sock:/var/run/docker.sock -v /home/jenkins_home:/var/jenkins_home  jenkins/jenkins`

## Instalação do Docker para poder executar o `mvn install dockerfile:build`

## Acesso SSH ao Container Jenkins

`docker exec -it -u root jenkins bash`

## Passos para instalar Docker

`apt-get update && `

`apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common && `

`curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && `

`add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && `

`apt-get update && `

`apt-get -y install docker-ce`

## Global Tool Configurations

# 1. JDK

Adicionar JDK

Nome: jdk8

Marcar checkbox instalar automaticamente

Versão JDK 8u221

Marcar checkbox Eu concordo com a licença do Java SE Development Kit

Clicar em "Conta Oracle"


# 2. Maven

Adicionar Maven

Nome: maven3

Marcar checkbox instalar automaticamente

Instalar a partir do Apache

Versão 3.6.1
