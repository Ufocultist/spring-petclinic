#!groovy
pipeline {
  environment {
    registry = "ufocultist/spring-petclinic"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.6.0'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
          script { 
//        sh 'docker build -t ufocultist/spring-petclinic .'
              dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
      }
    }
    stage('Deploy Spring Boot Application') {
	agent any
	steps {
	sh 'docker run -d -p 8081:8080 ufocultist/spring-petclinic'
	}
	}
    stage('Docker Push') {
      agent any
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
        }
      }
   }
}
