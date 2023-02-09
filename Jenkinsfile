pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                script {
                    sh "git clone https://github.com/kandreasyan/aca-devops-training"
                }
            }
        }
        stage('Test') {
            steps {
                echo 'test'
            }
        }
        stage('Build') {
            steps {
                echo 'docker build'
            }
        }
    }
}
