pipeline {
 agent any
    tools {
        jdk 'jdk8'
        maven 'maven3'
    }
    stages {
        stage('Build') {             
            steps {
               def dockerTool = tool name: 'docker-latest', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'

                withEnv([
                "DOCKER_TLS_VERIFY=1",
                "DOCKER_HOST=tcp://10.0.75.0:2375",
                 "DOCKER=${dockerTool}/bin"
                ]) {
                  sh 'mvn install dockerfile:build'
                }
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                sh 'chmod 777 ./scripts/deliver.sh'
                sh './scripts/deliver.sh'             
            }
        }
    }
}
