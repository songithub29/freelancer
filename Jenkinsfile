pipeline {
  agent any

  tools {
    maven 'my-maven'
  }

  stages {

    stage('Build with Maven') {
      steps {
        sh 'mvn --version'
        sh 'java -version'
        sh 'mvn clean package'
      }
    }

    stage('Packaging/Pushing imagae') {
      steps {
        withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
          sh 'docker build -t dockerlbt/springboot .'
          sh 'docker push dockerlbt/springboot'
        }
      }
    }

    stage('Deploy Spring Boot to DEV') {
      steps {
        echo 'Deploying and cleaning'
        sh 'docker image pull dockerlbt/springboot'
        sh 'docker container stop docker-springboot || echo "this container does not exist" '
        sh 'docker network create dev || echo "this network exists"'
        sh 'echo y | docker container prune '

        sh 'docker container run -d --rm --name docker-springboot -p 8090:8080 --network dev  dockerlbt/springboot'
      }
    }
  }

  post {
    // Clean after build
    always {
      cleanWs()
    }
  }
}
