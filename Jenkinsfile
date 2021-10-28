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
            }
        }

        stage('Run tests in parallel A') {
            steps {
                sh 'npx cypress run --config-file cypress-custom.json --record --key a73472fd-473e-410b-9932-95f3dc9d20d0  --parallel'
                }
            }
        }
    }

     post{
        always{
            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepALL: true, reportDir: 'cypress/report', reportFiles: 'index.html', reportName: 'HTML repor', reportTitles: ''])
        }
     }
}