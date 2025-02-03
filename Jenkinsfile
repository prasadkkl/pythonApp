pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "python_app:latest"
        CONTAINER_NAME = "python_app_container"
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/prasadkkl/pythonApp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d --name $CONTAINER_NAME $IMAGE_NAME'
                }
            }
        }

        stage('Show Result') {
            steps {
                script {
                    sh 'docker logs $CONTAINER_NAME'
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up..."
            sh 'docker stop $CONTAINER_NAME || true'
            sh 'docker rm $CONTAINER_NAME || true'
           //sh 'docker rmi $IMAGE_NAME || true'
        }
    }
}
