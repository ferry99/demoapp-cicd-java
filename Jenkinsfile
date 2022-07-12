pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-ferry9999')
        appname = "demoapp"
        version = "v1.0.0-M.5"
    }

    stages {
        stage('Build JAR') {
            steps {
                dir('C:\\_FERRY\\ELI project\\upcoming-project\\app_demo') {
                    bat "mvn -v"
                    bat "mvn clean package \"-DfinalName=${appname}-${version}\" -DskipTests"                  
                }
            }
        }
        stage('Build Images') {
            steps {
                dir('C:\\_FERRY\\ELI project\\upcoming-project\\app_demo') {                  
                    bat "docker build -t ${appname}:${version} ."
                    bat "docker tag ${appname}:${version} ferry9999/${appname}:${version}"                 
                }
            }
        }
        
        stage('Push Images') {
            steps {
                bat "mvn -v"
                //   withCredentials([usernamePassword(credentialsId: 'docker-hub-ferry9999', passwordVariable: 'DOCKERHUB_PASS', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                //         bat "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASS"
                //     }
                //     bat "docker push ferry9999/${appname}:${version}"
            }
        }

    }
}
