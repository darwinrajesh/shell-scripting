pipeline{
    agent any
    environment {
        ABC_URL = "test.google.com"
        XYZ_URL = "null"
    }
    stages{
        stage("A"){
            steps {
                sh "env"
                sh "echo ========executing A======== "
                sh "echo value of ABC_URL is ${ABC_URL}"
                // sh "echo value of XYZ_URL is ${XYZ_URL}"
            }
        }
        stage("B"){
            steps {
                sh "echo ========executing b======== "
                script {
                    if(env.XYZ_URL == null || env.XYZ_URL == "") {
                        echo "ABC_URL is null or empty and value is ${XYZ_URL}"
                    } else {
                        echo "value is empty : ${ABC_URL}"
                        }

                    }
                }
            }
        }
    }
