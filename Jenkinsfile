pipeline {
 agent any
    tools {
        jdk 'jdk8'
        maven 'maven3'
    }
    stages {
        stage('Build') { 
            withEnv([
             "DOCKER_TLS_VERIFY=1",
             "DOCKER_HOST=tcp://localhost:2376"
            ]) 
            steps {
                sh 'mvn install dockerfile:build' 
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
