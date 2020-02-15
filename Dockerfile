# stage 1
FROM centos:latest

#Install NPM
RUN dnf install -y npm

#to check version
RUN npm --version

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

# stage 2
FROM httpd:latest
COPY --from=node /app/dist/ /var/www/html/petclinic
