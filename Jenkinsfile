pipeline {
    agent none
    stages {
        stage('Build') {
            agent { label 'java && jdk-17' }
            steps {
                git branch: 'main', url: 'https://github.com/SvarshikPlaton/discord-backend-logs-bot.git'
                sh '''
                    chmod 744 ./mvnw
                    ./mvnw clean package
                '''
            }
        }
        stage('Deploy') {
            agent { label 'java && jdk-17' }
            steps {
                sh '''
                    
                '''
            }
        }
        stage('Run') {
            agent { label 'java && target && dev' }
            steps {

                sh '''
                    sudo systemctl stop provedcode || true
                    chmod 755 ./backend/install-systemd-service.sh
                    ./backend/install-systemd-service.sh
                    mv -f ./demo-${BUILD_NUMBER}.jar ~/demo.jar
                    sudo systemctl enable provedcode --now
                '''
            }
        }
    }
}