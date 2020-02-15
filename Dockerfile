# stage 1
FROM centos:latest

#Install NPM
RUN dnf install -y npm

#to check version
RUN npm --version

#Install Apache
RUN yum -y install httpd

#Copy updated configuration to apache
COPY httpd.conf /etc/httpd/conf/httpd.conf

#To uninstall old version might need --force for privlege
RUN npm uninstall -g angular-cli @angular/cli

#CLEAR npm Cahce
RUN npm cache clean --force

#Install angular latest version
RUN npm install -g @angular/cli@latest

#Change workdirectory 
WORKDIR /app

COPY . . 

#Execute build 
RUN npm install

#Package build
#RUN npm run build --prod

RUN ng build --prod --base-href=.

#Create directory to put build int
RUN mkdir  /var/www/html/petclinic

#Copy deliverables in Apache
RUN cd /var/www/html/petclinic  && cp -r /app/dist/* .

#Start Apache in Forground
CMD ["apachectl", "-D", "FOREGROUND"]

#Exposes the apache port to be accessible outside of container
EXPOSE 9090

