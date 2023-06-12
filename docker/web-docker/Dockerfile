FROM ubuntu:latest
LABEL "Author"="Amos Kamau"
LABEL "Project"="Website"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y \
    apache2 \
    git
WORKDIR /var/www/html
COPY . .
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
RUN rm -rf /var/www/html/
RUN git clone https://github.com/Kambreezy/church-mockup-website.git /var/www/html/
VOLUME /var/log/apache2
EXPOSE 80

#Access the website on port :80
