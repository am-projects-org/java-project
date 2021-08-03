pipeline{
    agent any;
    stages{
        stage('clean workspace'){
            steps{
                cleanWs()   
            }
        }
        stage('pull the code'){
            steps{
                echo "pulling the code from the master branch"
                git url: "https://github.com/am-projects-org/java-project.git", branch: "master"
                //sh "git clone https://github.com/am-projects-org/java-project.git"    
            }
        }
        stage('maven build'){
            steps{
                echo "Running the maven clean package command"
                sh "ls -l"
                sh "mvn clean package"
                //sh "cd /var/lib/jenkins/workspace/BuildJob-web-application/java-project && mvn clean package"
            }
        }
        stage('docker build image'){
            steps{
                echo "building the dockerfile to a image"
                sh "docker build -t registryazureacr.azurecr.io/java-project:${BUILD_NUMBER} ."
            }
        }
        stage('docker login and push image'){
           steps{
                 withCredentials([usernamePassword(credentialsId: 'azure_acr_cred', passwordVariable: 'password', usernameVariable: 'username')]) {
                    echo "docker login"
                    sh "docker login -u $username -p $password registryazureacr.azurecr.io"
                }
                echo "pushing the docker image"
                sh "docker push registryazureacr.azurecr.io/java-project:${BUILD_NUMBER}"
            }
        }
        stage('deploy docker image and run the application'){
            steps{
                echo "push the compose file to the prod server"
                sh "sed 's/BUILD_NUMBER/${BUILD_NUMBER}/' docker-compose.yml "
                sshagent(['docker_prod_machine_sshAgent']) {
                  sh "scp -o StrictHostKeyChecking=no -i /home/azureuser/.ssh/id-rsa docker-compose.yml azureuser@20.204.81.251:/home/azureuser/java-web-application/docker-compose.yml"
                    echo "making ssh connection to the prod server"
                    sh "ssh -o StrictHostKeyChecking=no azureuser@20.204.81.251 docker rm -f javawebappcontainer || true"
                    echo "docker pull and run"
                    withCredentials([usernamePassword(credentialsId: 'azure_acr_cred', passwordVariable: 'password', usernameVariable: 'username')]) {
                        echo "docker login"
                        sh "docker login -u $username -p $password registryazureacr.azurecr.io"
                        sh "ssh -o StrictHostKeyChecking=no azureuser@20.204.81.251 /home/azureuser/java-web-application/docker-compose -d up"
                    }
                } 
            }
        }
    }
}