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
                        sh 'npx cypress run --record --key fdfac40c-afdd-45f4-94f1-1b8d383175ac --parallel'
                    }
                }
                stage('Run tests in parallel B') {
                    steps {
                        sh 'npx cypress run --record --key fdfac40c-afdd-45f4-94f1-1b8d383175ac --parallel'
                    }
                }
                stage('Run tests in parallel C') {
                    steps {
                        sh 'npx cypress run --record --key fdfac40c-afdd-45f4-94f1-1b8d383175ac --parallel'
                    }
                }
            }
        }
    }
}