pipeline {
     agent any
     stages{
          stage("git") {
             step(git branch: 'main', credentialsId: '842be1dd-0c6a-46f2-896b-dead2fe71d4c', url: 'https://github.com/csowji/cmrproject.git')
          }
         stage("maven build"){
            step('mvn clean install')
         }
         stage("build image"){
            steps
             sh "docker build -t cmrproject-repo/myapp:1.0 ."
             sh "docker run -dt cmrproject-repo/myapp:1.0 /bin/bash"
             sh "docker tag cmrproject-repo/myapp:1.0 dharanig746/cmr-repo:1.0"
             sh "docker push sowji19999/cmr-repo:1.0"
         }
    }
}
