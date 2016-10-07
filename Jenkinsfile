#!groovy

properties([
  buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10')),
  pipelineTriggers([[$class: 'PeriodicFolderTrigger', interval: '2m']])
])

node {
  stage('Checkout') {
    checkout scm
    sh 'git rev-parse --short HEAD > GIT_COMMIT'
    short_commit = readFile('GIT_COMMIT').trim()
    currentBuild.description = "${short_commit}"
  }

  stage('Build') {
    image = docker.build("alecharp/java-build-tools:${short_commit}")
  }

  stage('Publish') {
    image.push()
  }
}
