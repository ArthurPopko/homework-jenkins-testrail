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
                stage('CREATE TEST PLAN') {
                    steps {
                        echo "CREATE TEST PLAN A"
                        sh 'sh createTestPlan.sh true'
                    }
                }

                stage('RUN TESTS IN PARALLEL A') {
                    steps {
                        echo "RUN TESTS IN PARALLEL A"
                        sh 'npx cypress run --config-file cypress-custom.json --record --key f0e802be-02b5-42f2-9c22-e61d7c44be18  --parallel'
                    }
               }

               stage('CREATE TEST PLAN') {
                    steps {
                        echo "CREATE TEST PLAN B"
                        sh 'sh createTestPlan.sh true'
                    }
               }

               stage('RUN TESTS IN PARALLEL B') {
                    steps {
                        echo "RUN TESTS IN PARALLEL B"
                        sh 'npx cypress run --config-file cypress-custom.json --record --key f0e802be-02b5-42f2-9c22-e61d7c44be18  --parallel'
                    }
               }
            }
        }
    }
}
