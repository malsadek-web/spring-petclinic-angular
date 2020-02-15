# stage 1
FROM centos:latest

#Install NPM
RUN dnf install -y npm

#to check version
RUN npm --version

#Install Apache
RUN yum -y install httpd

#To uninstall old version might need --force for privlege
RUN npm uninstall -g angular-cli @angular/cli

#CLEAR npm Cahce
RUN npm cache clean --force

#Install angular latest version
RUN npm install -g @angular/cli@latest

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build --prod

RUN pwd

#Create directory to put build int
RUN mkdir  /var/www/html/petclinic

#Copy deliverables in Apache
RUN cd /var/www/html/petclinic  && cp -r /app/dist/* .
