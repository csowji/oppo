FROM Tomcat
COPY /var/lib/jenkins/workspace/project_pipeline/targets/my-app1.0-SNAPSHOT.jar /usr/local/tomcat/webapps/my-app1.0-SNAPSHOT.jar        
