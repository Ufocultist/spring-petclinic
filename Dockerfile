FROM jenkins/jenkins:latest 
LABEL maintainer="ufocultist@mail.ru" 
COPY /target/spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar /home/spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar 
CMD ["java","-jar","/home/spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar"]
