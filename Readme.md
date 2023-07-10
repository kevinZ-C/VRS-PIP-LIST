# 示波器语音交互系统
## 系统部署运行操作流程
### 语音唤醒模块 Snowboy
1. sudo apt install python3-pip python3-dev libatlas-base-dev swig

2. sudo apt-get install python-pyaudio python3-pyaudio sox

3. pip3 install pyaudio

4. 如果运行时遇到Snowboy不兼容问题，则需要将Sonwboy仓库克隆下来，重新编译，将生成的文件替换：
git clone https://github.com/Kitt-AI/snowboy.git
cd snowboy/swig/Python3
make
将生成的_snowboydetect.so和snowboydetect.py文件复制到后端源代码的目录下
### 语音播报模块 Ekho
1. sudo apt install libsndfile1-dev libpulse-dev libncurses5-dev libmp3lame-dev libespeak-dev libespeak

2. git clone https://github.com/torch/ekho.git

3. cd ekho
./configure
make
sudo make install
### 录音模块、语音识别、语义匹配
1. git clone https://github.com/kevinZ-C/VRS-PIP-LIST.git
2. pip3 install -r requirements.txt
### 前端
1. 将前端源代码复制到用户根目录下即可
### 模型识别运行参数配置
1. sudo vim ~/.bashrc
2. 在文件末尾添加：
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.../Wenet/runtime/onnxruntime/fc_bace/onnxruntime-src/lib
3. source ~/.bashrc
### 其他运行部署
1. 数据库部署请自行部署
2. 语音交互系统自启动部署详见用户手册
3. 系统更多运行参数配置可修改config.ini
