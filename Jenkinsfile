pipeline {
    agent any
    tools {nodejs "node16"} // helps with "npm not found issue"

    stages {
        stage('build') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run tests in parallel A') {
            steps {
                sh 'npx cypress run --record --key f0e802be-02b5-42f2-9c22-e61d7c44be18  --parallel'
            }
        }
    }
}
