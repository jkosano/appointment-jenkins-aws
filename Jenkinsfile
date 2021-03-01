node {    

    environment {
        dockerImage = ''
        //import 
        registry = 'jpk912/appointment2'
        //import docker hub credentials
        //REGISTRY_CREDENTIAL = credentials('DOCKER_ID')
    }
      //def app     
      stage('Clone repository') {               
            
            checkout scm
      }     
      stage('Build image') {    

            sh ''' #!/bin/bash
                echo "Building apache...."
            '''
            website = docker.build("jpk912/appointment2-jenkins-apache-aws", "-f nginx/Dockerfile .")

            // sh ''' #!/bin/bash
            //     echo "Building sql...."
            // '''
            //sqldb = docker.build("jpk912/appointment2-jenkins-sqldb", "-f sql/Dockerfile .")

       }     
      stage('Test image') {           
            sh '''
                echo "Tests would go here dfjiaj...."
            '''  
        }     
       stage('Push image') {

           //push to docker-hub
           //login and push to registry. DOCKER_ID is the jenkins credentials created. No need to import into jenkinsfiles
            docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_ID') {            
                website.push("${env.BUILD_NUMBER}")            
                //sqldb.push("${env.BUILD_NUMBER}")            
                website.push("latest")        
            }   

            // //push to ecr
            // docker.withRegistry('public.ecr.aws/x6x7q3g7', 'DOCKER_ID') {            
            //     website.push("${env.BUILD_NUMBER}")            
            //     //sqldb.push("${env.BUILD_NUMBER}")            
            //     //website.push("latest")        
            // }   

            // sh '''
            //     aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/x6x7q3g7 

        
            // '''

            //website.push("${env.BUILD_NUMBER}")
            
        }
}