FROM tomcat:9.0.38-jdk11

#Instalación de las herramientas básicas para poder manejarme
RUN apt update && apt install -y nano && apt install -y inet-utils
