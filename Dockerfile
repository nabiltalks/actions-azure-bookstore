FROM tomcat:8.0.20-jre8

RUN mkdir /usr/local/tomcat/webapps/myapp
COPY ${GITHUB_WORKSPACE}/target/reading-time-app.war /usr/local/tomcat/webapps/reading-time-app.war
