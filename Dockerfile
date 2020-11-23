FROM tomcat:9.0.39-jdk11

# Installing basic tools
RUN apt update && apt install -y nano && apt install -y  vim 

# Enable manager app, host manager app and docs apss
RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/webapps.dist

# Copying my tomcat-users.xml to the container
# TO-BE-DONE user password as a docker build arg
COPY mytomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Context Modifying from all default apps
COPY mycontext.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
COPY mycontext.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

# COPY THE APP
COPY webapp.war /usr/local/tomcat/webapps/webapp.war