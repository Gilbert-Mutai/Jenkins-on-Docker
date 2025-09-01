pipeline {
    agent { 
        node {
            label 'docker-agent-python'
        }
    }
    triggers {
        // poll SCM every 5 minutes
        pollSCM('H/5 * * * *')
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                cd myapp
                python3 -m venv venv
                . venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                cd myapp
                . venv/bin/activate
                python hello.py
                python hello.py --name=Brad
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
    }
}
