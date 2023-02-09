pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo 'git clone'
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
