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
                sh 'npx cypress run --config-file cypress-custom.json --record --key a73472fd-473e-410b-9932-95f3dc9d20d0  --parallel'
            }
        }
    }
}
