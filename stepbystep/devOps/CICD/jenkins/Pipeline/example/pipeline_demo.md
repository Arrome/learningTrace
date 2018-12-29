```
#!/usr/bin/env groovy

@NonCPS
def method(){

}

node('master'){
  withEnv(['PATH=/usr/sbin:/usr/bin']){
    stage('step1'){

    }

    stage('step2'){
      parallel firstBranch:{

      },secondBranch:{

      },failFast:false

    }

  }
}
```
