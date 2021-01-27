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
   }
 }
