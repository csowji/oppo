FROM Tomcat
COPY /var/lib/jenkins/workspace/project_pipeline/targets/my-app1.0-SNAPSHOT.jar /var/lib/tomcat9/webapps/my-app1.0-SNAPSHOT.jar        
