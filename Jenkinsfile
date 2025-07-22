pipeline {
     tools {
        jdk 'olaab-java'
        maven 'olaab-maven'
    }


    agent any

    stages {
        stage('Checkout') {
            agent {
                label 'master'
            }
            steps {
                echo 'Cloning...'

                git 'https://github.com/Yomi-Olaniyan/repo-forked-from-RayItern.git'
            }
        }

        stage('Compile') {
            agent { label 'slave-one' }
            steps {
                echo 'Compiling...'
                sh 'mvn compile'
            }
        }
stage('CodeReview') {
            agent { label 'slave-one' }
            steps {
                echo 'Code Review...'
                sh 'mvn pmd:pmd'
            }
        }

        stage('UnitTest') {
            agent { label 'slave-two' }
            steps {
                echo 'Testing...'
                sh 'mvn test'
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
                sh 'mvn package'
            }
        }
    }
 }
