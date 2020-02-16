node {
    def app
    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */
        checkout scm
    }
  


  
 
 stage('distribute build'){

      script{
                  echo " copy the backend application to backend server...... "  
                  
             }
    sh """
     scp -r docker-compose.yml ftend@110.0.4.24:/home/ftend/petclinic-fe
     ssh  ftend@110.0.4.24 "  cd /home/ftend/petclinic-fe  && docker run -dit -p 7070:9090 malsadek/redteam-petclinicfe "
     
     """

 }
  
}
