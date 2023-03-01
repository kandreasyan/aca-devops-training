pipeline { 
    agent any
    
    environment {
        WEB_HOSTNAME = "app-aca.ddns.net"
        WEB_URL = "https://${WEB_HOSTNAME}"
        DOCKERHUB_USERNAME = "andreasyan"
        // DOCKERHUB_PASSWORD = credentials("dockerhub_password")
        DOCKERHUB_PASSWORD = "super-secure-text"
        IMAGE_VERSION = "latest"
    }
    stages {
        stage('Prepare') {
            steps {
                script {
                    sh '''printenv &&
                    cd applications
                    '''
                    echo "echo ${DOCKERHUB_PASSWORD} | docker login -u $DOCKERHUB_USERNAME --password-stdin"
                }
            }
        }
        stage('Build Frontend') {
            environment {
                REACT_APP_API_BASE_URL = "${WEB_URL}/api"
            }
            steps {
                dir("frontend-react") {
                    sh "ls -la"
                    echo "#npm install && npm run build"
                    echo "docker build -t ${DOCKERHUB_USERNAME}/frontend-react:$IMAGE_VERSION --build-arg REACT_APP_API_BASE_URL=${REACT_APP_API_BASE_URL}"
                    echo "docker push ${DOCKERHUB_USERNAME}/frontend-react:$IMAGE_VERSION"
                }
            }
        }
        stage('Build Backend') {
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
                    sh 'ssh -o StrictHostKeyChecking=no -i ${KEY_FILE} root@${DEV_SERVER_IP} '
                }
            }   
        }
    }
}
