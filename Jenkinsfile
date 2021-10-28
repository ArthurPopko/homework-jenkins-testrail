pipeline {
    agent any
    tools {nodejs "node16"} // helps with "npm not found issue"

    parameters{
    string(name: 'SPEC', defaultValue: "cypress/integration/**/**", description: "Enter the script path that you want to execute")
    choice(name: 'BROWSER', choices: ['chrome','edge','firefox'], description: "Choice the browser you want to run")
    }

    options{
    ansiColor('xterm')
    }

    stages {
        stage('build') {
            steps {
                sh 'npm install'
                sh 'npm install cypress'
                sh 'npm install cypress-testrail-logs-screenshots'
            }
        }
        stage('parallel') {
            parallel {
                // start several test jobs in parallel, and they all
                // will use Cypress Dashboard to load balance any found spec files
                stage('Run script') {
                    steps {
                        sh 'sh create_testplan.sh true'
                    }
                }
                stage('Run tests in parallel A') {
                    steps {
                        sh 'npx cypress run --config-file cypress-custom.json --record --key a73472fd-473e-410b-9932-95f3dc9d20d0  --parallel'
                    }
                }
//                 stage('Run tests in parallel B') {
//                     steps {
//                         sh 'npx cypress run --record --key a73472fd-473e-410b-9932-95f3dc9d20d0 --parallel'
//                     }
//                 }
            }
        }
    }
}