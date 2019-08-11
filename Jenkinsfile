pipeline {
     agent any
    tools {
        jdk 'jdk8'
        maven 'maven3'
    }
    stages {
        stage('Build') {             
            steps {
                  sh 'mvn install'
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
                sh 'docker build . -t carloskafka7/springboot-docker'
                sh 'docker push carloskafka7/springboot-docker'
                sh 'chmod 777 ./scripts/deliver.sh'
                sh './scripts/deliver.sh'             
            }
        }
    }
}
