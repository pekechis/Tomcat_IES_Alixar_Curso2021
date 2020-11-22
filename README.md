# Tomcat_IES_Alixar_Curso2021

Dockerfile para el Tomcat usado en el IES Alixar durante el curso 20/21

No se recomienda usar en producción ya que es una imagen creada únicamente con propósitos de docecia.

## Características

1. **Versión de Tomcat:** 9.0.39-jdk11
2. Instalación de la aplicación **nano**
3. Habilitación de las aplicaciones de Tomcat: **docs, manager y host-manager**
4. Creación de un usuario tomcat/tomcat que tiene los roles necesarios para la administración del sistema

## Ejecución

Para la puesta en marcha de una instancia de la imagen debemos:

_docker run -d -it --rm -p 8888:8080 --name tomcat -v $(pwd)/webapps:/usr/local/tomcat/webapps jperjim398/tomcatcurso2021_