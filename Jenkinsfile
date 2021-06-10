#!groovy
pipeline {
  environment {
    registry = "ufocultist/spring-petclinic"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }

  parameters {
  imageTag(name: 'DOCKER_IMAGE', image: 'ufocultist/spring-petclinic')
  }
  agent none
  stages {
    stage('Docker Pull') {
      agent any
      steps {
          script {
	      docker.withRegistry( '', registryCredential ) {
	      image = docker.image($image:$tag)
	      image.pull()
              }
          }
      }
    }
    stage('Deploy Spring Boot Application') {
	agent any
	steps {
	sh 'docker run -d -p 8081:8080 ufocultist/spring-petclinic'
	}
	}
   }
}
