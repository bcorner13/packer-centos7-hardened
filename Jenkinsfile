pipeline {
    agent any
    stages {
	  stage('Git Repository') {
			steps {
        dir('packer-centos7-hardend') {
          git url: "git@git.ipacc.com:AutomationTooling/packer-centos7-hardened.git", branch: 'master', credentialsId: 'jenkins_gitlab'
        }
			}
	  }
	  stage('Run-Packer') {
			steps {
				withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "awskey-${params.ACCOUNT}"]]) {
          dir('packer-centos7-hardened'){
            sh script: "packer validate -only=amazon-chroot packer-centos7-hardened.json"
          }
        }
			}
	  }
  }
}
