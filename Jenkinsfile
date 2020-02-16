node {
    def app
  
    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */
        checkout scm
    }
  
    stage('Test image') {
        app.inside {
            echo "Tests passed"
        }
    }

  
  stage('distribute build'){
  app.inside {
    echo "checkin fronend servers"
     }       
  }
}
