FROM ubuntu:latest 
#Assuming the server runs ubuntu
LABEL "Project"="Amos Web"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install apache2 -y
WORKDIR /var/www/html/
#COPY websitefiles.tar.gz /var/www/html/
ADD websitefiles.tar.gz /var/www/html/
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
VOLUME /var/log/apache2
EXPOSE 80 
#Access the website on port :80
