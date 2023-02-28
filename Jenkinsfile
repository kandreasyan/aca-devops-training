pipeline { 
    agent any
    
    stages {
        stage('Prepare') {
            steps {
                script {
                    echo "clone"
                }
            }
        }
        stage('Build') {
            steps {
                echo 'test'
            }
        }
        stage('Deploy') {
            environment {
                DEV_SERVER_IP = "167.71.36.251"
                // SERVER_IP = BRANCH_NAME == "develop" ? DEV_SERVER_IP : PROD_SERVER_IP
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: "droplet-ssh-key", keyFileVariable: 'KEY_FILE')]) {
                    sh 'ssh -o StrictHostKeyChecking=no -i ${KEY_FILE} root@${DEV_SERVER_IP}'
                }
            }   
        }
    }
}
