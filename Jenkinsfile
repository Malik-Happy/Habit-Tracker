pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/Malik-Happy/Habit-Tracker.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'apt-get update'
                sh 'apt-get install -y pkg-config libmysqlclient-dev'
                sh 'python3 -m venv venv'
                sh './venv/bin/pip install -r requirements.txt'
            }
        }
        stage('Migrate Database') {
            steps {
                sh './venv/bin/python manage.py migrate'
            }
        }
        stage('Collect Static Files') {
            steps {
                sh './venv/bin/python manage.py collectstatic --noinput'
            }
        }
        stage('Run Server') {
            steps {
                sh './venv/bin/python manage.py runserver 0.0.0.0:8000'
            }
        }
    }
}
