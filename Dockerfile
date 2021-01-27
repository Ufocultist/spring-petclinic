FROM jenkins/jenkins:2.263.3-lts-jdk11 
LABEL maintainer="ufocultist@mail.ru" 
COPY /target/spring-petclinic-1.5.1.jar /home/spring-petclinic-1.5.1.jar 
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]
