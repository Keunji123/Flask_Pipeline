pipeline {
    agent any
    parameters {
        choice(name: 'VERSION', choices: ['2.2', '3.3'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
    stages {
        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("Checkout") {
            steps {
                checkout scm
            }
        }
        stage("build") {
            steps {
                sh 'docker-compose build web'
            }
        }
        stage("test") {
            when {
                expression {
                    params.executeTests
                }
            }
            steps {
                script {
                    gv.testApp()
                }
            }
        }
        stage("deploy") {
            steps {
                sh "docker-compose up -d"
            }
        }
    }
}
