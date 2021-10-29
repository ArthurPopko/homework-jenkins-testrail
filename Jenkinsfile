pipeline {
    agent any
    tools {nodejs "node16"} // helps with "npm not found issue"

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
                        echo "Parallel A"
                        sh 'sh createTestPlan.sh true'
                        sh 'npx cypress run --config-file cypress-custom.json --record --key f0e802be-02b5-42f2-9c22-e61d7c44be18  --parallel'
                    }

                stage('Run tests in parallel B') {
                    steps {
                        echo "Parallel B"
                        sh 'sh createTestPlan.sh true'
                        sh 'npx cypress run --config-file cypress-custom.json --record --key f0e802be-02b5-42f2-9c22-e61d7c44be18  --parallel'
                    }
                }
            }
        }
    }
}
