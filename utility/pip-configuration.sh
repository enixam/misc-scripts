# open pip configuration file
code C:\Users\Lenovo\pip\pip.ini
# use tsinghua mirror globally, add the following lines in the above file
[global]
index-url=https://pypi.tuna.tsinghua.edu.cn
[install]
trusted-host = https://pypi.tuna.tsinghua.edu.cn

# or use pip command
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# aliyun
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/

# use tsinghua mirror once
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package

# install a package without C extensions
pip install some-package --install-option="--without-c-extensions"
