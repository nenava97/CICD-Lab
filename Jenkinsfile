pipeline {
  agent any
   stages {
    stage ('create container') {
      agent{label 'DockerAgent'}
      steps {
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'aws_access_key'), 
                        string(credentialsId: 'AWS_SECRET_KEY', variable: 'aws_secret_key')]) {
                            dir('docker') {
                              sh 'sudo docker build -t kuracontainers .' 
                            }
        }
       }
    }
    stage('Push to Dockerhub') {
     agent{label 'DockerAgent'}
     steps {
        script {
          sh '''#!/bin/bash
          sudo docker tag kuracontainers:latest nenava97/kuracontainers:latest
          sudo docker push nenava97/kuracontainers:latest
          '''  
            }
        }
     }
    stage('Start Container') {
     agent{label 'DockerAgent'}
     steps {
        script {
          sh '''#!/bin/bash
          sudo docker start nenava97/kuracontainers:latest
          '''  
            }
        }
     }
    }
   }
