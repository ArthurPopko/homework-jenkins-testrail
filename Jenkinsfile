pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                sh 'npm install'
            }
        }
        stage('parallel') {
            parallel {
                // start several test jobs in parallel, and they all
                // will use Cypress Dashboard to load balance any found spec files
                stage('Run tests in parallel A') {
                    steps {
                        sh 'npx cypress run --record --key aa01e3dd-6263-4187-9393-ea9d1a92acc1 --parallel'
                    }
                }
                stage('Run tests in parallel B') {
                    steps {
                        sh 'npx cypress run --record --key aa01e3dd-6263-4187-9393-ea9d1a92acc1 --parallel'
                    }
                }
                stage('Run tests in parallel C') {
                    steps {
                        sh 'npx cypress run --record --key aa01e3dd-6263-4187-9393-ea9d1a92acc1 --parallel'
                    }
                }
            }
        }
    }
}