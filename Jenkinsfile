pipeline {
    agent any
    stages{
    stage("Git Checkout"){
         steps{
            git credentialsId: 'github',https://github.com/csowji/cmrproject.git'
        }
        }
    stage("Maven Build"){
         steps{
              sh "mvn clean install"
              }
             }
     stage("Building image"){
         steps{
            sh "docker build -t cmrproject-repo/myapp:1.0 ."
            sh "docker run -dt cmrproject-repo/myapp:1.0 /bin/bash"
            sh "docker tag cmrproject-repo/myapp:1.0 dharanig746/cmr-repo:1.0"
            sh "docker push sowji19999/cmr-repo:1.0"
                    }
                }
       }
}                 
