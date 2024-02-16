pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'dotnet restore'
                sh 'dotnet build --configuration Release'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("dotnet-app:latest")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker stop web-app || true'
                    sh 'docker rm web-app || true'
                    sh 'docker run -d -p 8089:80 --name web-app dotnet-app:latest'
                }
            }
        }
    }
}
