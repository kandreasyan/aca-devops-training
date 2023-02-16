pipeline { 
    agent any
    stages {
        stage('Clone') {
            steps {
                script {
                    sh "clone"
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
