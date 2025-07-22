pipeline {
    agent none

    tools {
        jdk 'olaab-java'
        maven 'olaab-maven'
    }

    stages {
        stage('Checkout') {
            agent any
            steps {
                echo 'Cloning...'
                git 'https://github.com/Yomi-Olaniyan/repo-forked-from-RayItern.git'
            }
        }

        stage('Compile') {
            agent { label 'slave-one' }
            steps {
                echo 'Compiling...'
                dir('server') {
                    sh 'mvn compile'
                }
            }
        }

        stage('CodeReview') {
            agent { label 'slave-one' }
            steps {
                echo 'Code Review...'
                dir('server') {
                    sh 'mvn pmd:pmd'
                }
            }
        }

        stage('UnitTest') {
            agent { label 'slave-two' }
            steps {
                echo 'Testing...'
                dir('server') {
                    sh 'mvn test'
                }
            }
            post {
                success {
                    junit 'server/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Package') {
            agent { label 'master' }
            steps {
                echo 'Packaging...'
                dir('server') {
                    sh 'mvn package'
                }
            }
        }
    }
}
