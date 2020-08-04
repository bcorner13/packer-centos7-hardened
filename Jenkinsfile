pipeline {
    agent any
    stages {
	  stage('Git Repository') {
			steps {
        dir('stack-configuration') {
          git url: "git@git.ipacc.com:AutomationTooling/packer-centos7-hardened.git", branch: 'master', credentialsId: 'jenkins_gitlab'
        }
			}
	  }
	  stage('Run-Packer') {
			steps {
				withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "awskey-${params.ACCOUNT}"]]) {
				sh script: "cd packer-centos7-hardened; packer build -only=amazon-chroot packer-centos7-hardened.json"
				}
			}
	  }
  }
}
