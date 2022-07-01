pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-ferry9999')
        appname = "demoapp"
        version = "v1.0.0-M.3"
    }

    stages {
        stage('Build') {
            steps {
                dir('C:\\_FERRY\\ELI project\\upcoming-project\\app_demo') {
                    // some block
                    bat "mvn -v"
                    bat "mvn clean package \"-DfinalName=${appname}-${version}\" -DskipTests"
                    bat "docker build -t ${appname}:${version} ."
                    bat "docker tag ${appname}:${version} ferry9999/${appname}:${version}"
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-ferry9999', passwordVariable: 'DOCKERHUB_PASS', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        bat "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASS"
                    }
                    bat "docker push ferry9999/${appname}:${version}"
                    
                }

                // Run Maven on a Unix agent.

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
    }
}
