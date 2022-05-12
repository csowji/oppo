pipeline {
     agent any
     stages{
         stage("git checkout") {
          steps{
               git credentialsId: 'github', url: 'https://github.com/csowji/cmrproject.git6'
          }
          }
         stage("maven build"){
          steps{
              sh'mvn clean install'
                 }
                }
         stage("build image"){
          steps{
             sh "docker build -t cmrproject-repo/myapp:1.0 ."
             sh "docker run -dt cmrproject-repo/myapp:1.0 /bin/bash"
             sh "docker tag cmrproject-repo/myapp:1.0 dharanig746/cmr-repo:1.0"
             sh "docker push sowji19999/cmr-repo:1.0"
                    }
                   }
                 }
              }
