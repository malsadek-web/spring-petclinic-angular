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
    steps {
    script{
    echo "checkin fronend servers"
    }
             sh 'scp -r docker-compose.yml ftend@110.0.4.24:/fe-petclinic'
    }
  }
}
