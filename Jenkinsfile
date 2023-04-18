pipeline {
    agent none
    stages {
        stage('Build') {
            agent { label 'java && jdk-17' }
            steps {
                git branch: 'master', url: 'https://github.com/SvarshikPlaton/discord-backend-logs-bot.git'
                sh '''
                    export JAVA_HOME="/usr/lib/jvm/jdk-17/"

                    chmod 744 ./mvnw
                    ./mvnw clean package
                '''
            }
        }
        stage('Deploy') {
            agent { label 'java && jdk-17' }
            steps {
                sh '''
                    scp -i /var/lib/jenkins/.ssh/slave-SoftServe2023 -rp ./target/discord-backend-logs-bot-*-jar-with-dependencies.jar jenkins@10.0.1.172:/var/lib/jenkins/workspace/discord-backend-logs-bot/
                '''
            }
        }
        stage('Run') {
            agent { label 'java && target && dev' }
            steps {

                sh '''
                    rm -f ./discord-backend-logs-bot.jar
                    mv ./discord-backend-logs-bot-*.jar /var/lib/jenkins/discord-backend-logs-bot.jar

                    sudo systemctl stop discord-backend-logs-bot || true
                    chmod 755 ./install-systemd-service.sh
                    ./install-systemd-service.sh
                    sudo systemctl enable discord-backend-logs-bot --now
                '''
            }
        }
    }
}