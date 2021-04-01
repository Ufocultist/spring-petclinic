#!groovy
pipeline {
  agent none
  environment {
    DOCKER_BUILDKIT='1'
  }
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
        sh 'docker build -t ufocultist/spring-petclinic .'
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
//        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
//          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push ufocultist/spring-petclinic:latest'
        }
      }
   }
}
