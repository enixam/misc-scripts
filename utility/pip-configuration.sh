# open pip configuration file
notepad C:\Users\Lenovo\pip\pip.ini
# use tsinghua mirror globally, add the following lines in the above file
[global]
index-url=https://pypi.tuna.tsinghua.edu.cn
[install]
trusted-host = https://pypi.tuna.tsinghua.edu.cn

# or use pip command
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# use tsinghua mirror once
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
