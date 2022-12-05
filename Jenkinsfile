pipeline {
  agent any
   stages {
    stage ('Build') {
      steps {
        sh '''#!/bin/bash
        python3 -m venv test3
        source test3/bin/activate
        pip install pip --upgrade
        pip install -r requirements.txt
        export FLASK_APP=application
        flask run &
        '''
     }
   }
    stage ('test') {
      steps {
        sh '''#!/bin/bash
        source test3/bin/activate
        py.test --verbose --junit-xml test-reports/results.xml
        ''' 
      }

      post{
        always {
          junit 'test-reports/results.xml'
        }

      }
    }
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
