pipeline {
 agent any
    tools {
        jdk 'jdk8'
        maven 'maven3'
        docker 'docker-latest'
    }
    stages {
        stage('Build') {             
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
