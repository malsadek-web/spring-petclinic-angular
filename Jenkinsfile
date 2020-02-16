node {
    def app
    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */
        checkout scm
    }
  
    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("malsadek/redteam-petclinicfe")
    }
  
   stage('Test image') {
        
        app.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }
 
 stage('distribute build'){

      script{
                  echo " copy the backend application to backend server...... "  
                  
             }
    sh """
     scp -r docker-compose.yml pet-fe@110.0.4.47:/home/ftend/petclinic-fe
     ssh  pet-fe@110.0.4.47 "  cd /home/ftend/petclinic-fe  && docker run -dit -p 7070:9090 malsadek/redteam-petclinicfe "
     scp -r docker-compose.yml pet-fe@110.0.5.48:/home/ftend/petclinic-fe
     ssh  pet-fe@110.0.5.48 "  cd /home/ftend/petclinic-fe  && docker run -dit -p 7070:9090 malsadek/redteam-petclinicfe "
     """

 }
  
}
