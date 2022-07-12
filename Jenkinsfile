def notifySlack(String buildStatus = 'STARTED') {
    // Build status of null means success.
    buildStatus = buildStatus ?: 'SUCCESS'

    
    // def cause = currentBuild.rawBuild.getCause(hudson.model.Cause.UserIdCause.class)
    // def name = cause.getUserName()
    def color
    def msg = "${buildStatus} : `${env.JOB_NAME}` #${env.BUILD_NUMBER}: (<${env.BUILD_URL}|Open>)"

    if (buildStatus == 'STARTED') {
        color = '#D4DADF'
    } else if (buildStatus == 'SUCCESS') {
        color = '#08722E'
        msg = "${buildStatus} : `${env.JOB_NAME}` #${env.BUILD_NUMBER}\n" +
            "Stage : `${env.STAGE_NAME}`\n" +
            "Success after : ${currentBuild.durationString.replace(' and counting', '')} (<${env.BUILD_URL}|Open>)"
    } else if (buildStatus == 'UNSTABLE') {
        color = '#FFFE89'
    } else {
        color = '#FF9FA1'
        msg = "${buildStatus} : `${env.JOB_NAME}` #${env.BUILD_NUMBER}\n" +
            "Stage : `${env.STAGE_NAME}`\n" +
            "Failed after : ${currentBuild.durationString.replace(' and counting', '')} (<${env.BUILD_URL}|Open>)"
    }

    slackSend(color: color, message: msg)
}


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
                notifySlack()
                dir('C:\\_FERRY\\ELI project\\upcoming-project\\app_demo') {
                    bat "mvn -v"
                    bat "mvn clean package \"-DfinalName=${appname}-${version}\" -DskipTests"                  
                }
            }
            post {
                success {
                    notifySlack('SUCCESS')
                }
                unstable { 
                    notifySlack('UNSTABLE')
                }        
                failure {
                    notifySlack('FAILURE')
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
            post {
                success {
                    notifySlack('SUCCESS')
                }
                unstable { 
                    notifySlack('UNSTABLE')
                }        
                failure {
                    notifySlack('FAILURE')
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
            post {
                success {
                    notifySlack('SUCCESS')
                }
                unstable { 
                    notifySlack('UNSTABLE')
                }        
                failure {
                    notifySlack('FAILURE')
                }
            }
        }

    }
}
