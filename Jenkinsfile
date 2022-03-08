pipeline {
     agent any
     stages{
        stage("git") {
            step('github',https://github.com/csowji/cmrproject.git')
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
