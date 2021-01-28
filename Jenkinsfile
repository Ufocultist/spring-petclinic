#!groovy
pipeline {
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
        sh 'docker build -t ufocultist/spring-petclinic .'
      }
    }
    stage('Deploy Spring Boot Application') {
	agent any
	steps {
	//Remove maven-build-container if it exists
	//sh " docker rm -f java-deploy-container"
	//sh "docker run --name java-deploy-container --volumes-from maven-build-container -d -p 8080:8080 denisdbell/petclinic-deploy"
	sh 'docker run -d -p 8081:8080 ufocultist/spring-petclinic'
	}
	}
  }
}
