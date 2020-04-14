pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh '''
                   ./jenkins/build/build.sh mvn -B -DskipTest clean package
                   ./jenkins/build/script.sh 
                   '''
            }
        }

        stage('Test') {
            steps {
                sh './jenkins/test/test.sh mvn test'
   	    }
	}

        stage('Test') {
            steps {
                sh './jenkins/push/script.sh'
            }
        }
    }
}
