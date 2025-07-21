pipeline{
    tools{
        jdk 'olaab-java'
        maven 'olaab-maven'
    }
	agent any
      stages{
           stage('Checkout'){
	      agent  any	
              steps{
		 echo 'cloning..'
                 git 'https://github.com/Yomi-Olaniyan/repo-forked-from-RayItern.git'
              }
          }
          stage('Compile with slave-one'){
              agent {label 'slave-one'}
              steps{
                  echo 'compiling..'
                  sh 'mvn compile'
	      }
          }
          stage('CodeReview'){
              agent {label 'slave-one'}
              steps{
		    
		  echo 'codeReview'
                  sh 'mvn pmd:pmd'
              }
          }
          
          stage('Unit Tes with slave-two'){
              agent {label 'slave-two'}
              steps{
                  echo 'testing'
                  sh 'mvn test'
              }
              post {
              success {
                 junit 'target/surefire-reports/*.xml'
          }
          }

          stage('Package handled by master'){
              agent {label 'master'}
              steps{
                  sh 'mvn package'
              }
          }
      }
}
      }
}
