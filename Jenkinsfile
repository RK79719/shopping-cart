pipeline {
    agent { label 'labelname' }
    tools{
        jdk  'jdk11'
        maven  'maven3'
    }
    
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/RK79719/shopping-cart.git'
            }
        }
        
        stage('Compile the code') {
            steps {
                sh "mvn clean compile"
            }
        }
        
        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }
        
        stage('Docker Build & Push') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-hub', url: 'https://hub.docker.com/') {
                        
                        sh "docker build -t registry/shopping-cart -f Dockerfile"
                        sh "docker tag  registry/shopping-cart registry/shopping-cart:latest"
                        sh "docker push registry/shopping-cart:latest"
                    }
                }
            }
        }

        stage('Deploy the application') {
            steps {
                        sh deploy-files/build.sh

                }
        }
        
        
    }
}
