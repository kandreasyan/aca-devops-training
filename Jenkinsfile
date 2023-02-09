pipeline { 
    agent {
        docker { image 'node:16' }
    }

    stages {
        stage('Clone') {
            steps {
                script {
                    sh "node -v"
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
