pipeline {
    agent any

    environment {
        IMAGE_NAME = "python_app:latest"
        CONTAINER_NAME = "python_app_container"
        DOCKER_USER = "prasadkkl"
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
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }

        stage('Show Result') {
            steps {
                script {
                    sh "docker logs ${CONTAINER_NAME}"
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_PASS')]) {
                    script {
                        sh "echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin"
                    }
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    sh "docker tag ${IMAGE_NAME} ${DOCKER_USER}/${IMAGE_NAME}"
                    sh "docker push ${DOCKER_USER}/${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up..."
            sh "docker stop ${CONTAINER_NAME} || true"
            sh "docker rm ${CONTAINER_NAME} || true"
            // sh "docker rmi ${IMAGE_NAME} || true"  # Uncomment if you want to remove the image
        }
    }
}
