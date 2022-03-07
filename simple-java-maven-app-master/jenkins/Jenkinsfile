node('master'){
    // Add maven to path
    env.PATH = "/opt/maven3/bin/:$PATH"
    
    stage('Git Clone/Pull'){
        git branch: 'main', 
			url: 'https://github.com/csowji/cmrproject.git'
    }
	
	stage('Build Docker Image'){
		sh "mvn clean package"
		sh "mv target/*.war target/myweb.war"
		sh "docker build -t csowji/my-app:1.0 ."
	}
	
	stage('Push Image'){
	  withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
         sh "docker login -u kammana -p ${dockerHubPwd}"
      }
	  sh "docker push csowji/my-app:1.0"
i
	
	stage('Delete Old Container'){
	   sshagent (credentials: ['main-docker']) {
	       try{
		     def dockrRm = "docker rm -f my-app"
			 def dockrRmImage = "docker rmi  csowji/my-app:1.0"
	         sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.43.90  ${dockrRm} "
			 sh "ssh -o StrictHostKeyChecking=no ec2-user@3.131.159.123 ${dockrRmImage} "
		   }catch(e){
			  echo "container my-app not found" 
		   }
	   }
	   
	}
	
	stage('Deploy On main'){
		sshagent (credentials: ['dady']) {
		 def dockerRun = "docker run -d -p 8080:8080 --name=my-app csowji/my-app:1.0"
		 sh "ssh -o StrictHostKeyChecking=no ec2-user@3.131.159.123  ${dockerRun} "
		}
	}
    
}
