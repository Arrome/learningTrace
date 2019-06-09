# 安装

编译安装
----------

多版本工具pyenv<br>
-----------------
功能：一台开发机上建立多个版本的python环境，并提供方便的切换方法，**可随意切换当前默认的python版本**。<br>

  git方式安装pyenv工具：
  1. 预安装git
  2. 克隆仓库 `git clone https://github.com/yyuu/pyenv.git ~/.pyenv`
  3. 配置环境变量,并激活
  ```
  export PATH=~/.pyenv/bin:$PATH
  export PYENV_ROOT=~/.pyenv
  eval "$(pyenv init -)"
  ```
  `pyenv install --list` 查看支持版本
  `pyenv local xxx`

virtualenv工具
-------------
**Python3.3以上的版本通过venv模块原生支持虚拟环境，可以代替Python之前的virtualenv。**<br>
功能：**将一个目录建立为一个虚拟的python环境**，用户可以建立多个虚拟环境，环境之间相互独立<br>

安装pip：`yum -y install python-pip`

pip安装方式:`pip install virtualenv`<br>
创建虚拟环境：`virtualenv xxx_env --python=python3`<br>
激活虚拟环境：`source xxx_env/bin/activate`<br>
关闭虚拟环境：`deactivate`<br>


第三方库安装方式
------------
![三方库仓库地址](https://pypi.org/)<br>

1. `pip install XXX`（库若不在pypi,可离线安装）
2. 源文件安装，下载安装包，`python setup.py install`


`pip install -r requirement.txt`
