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
     scp -r docker-compose.yml ftend@110.0.4.24:/fe-petclinic 
     """

 }
  
}
