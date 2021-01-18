FROM tomcat:9.0.39-jdk11

# Installing basic tools
RUN apt update && apt install -y nano && apt install -y  vim  && apt install -y openssh-server

# Enable manager app, host manager app and docs apss
RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/webapps.dist

# Copying my tomcat-users.xml to the container
# TO-BE-DONE user password as a docker build arg
COPY mytomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Context Modifying from all default apps
COPY mycontext.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
COPY mycontext.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

# Creo el usuario para ejecutar los servicios
RUN useradd -p $(openssl passwd -crypt '12345') usuario

# Configuración del servicio ssh
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Copio el fichero del script al directorio /usr/bin
COPY startservices.sh /usr/bin/startservices.sh

# Le doy los permisos adecuados
RUN chmod +x /usr/bin/startservices.sh

# Ejecuto el CMD como usuario
USER usuario

CMD ["startservices.sh"]
