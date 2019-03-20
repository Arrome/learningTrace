```
#!/usr/bin/env groovy
//使用不可序列化的对象的方法时
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
