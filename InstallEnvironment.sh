#！/bin/bash
# 该文件用以自动配置语音交互系统所需的环境
# V0.1.0 测试用 无执行失败判断 不使用虚拟环境
set -e

echo "开始配置语音交互系统所需环境"

sudo apt update
# sudo apt upgrade

sudo rm -r InstallEnv
mkdir InstallEnv
cd InstallEnv

echo "开始配置语音唤醒模块"
sudo apt install python3-pip python3-dev libatlas-base-dev swig -y
sudo apt-get install python3-pyaudio sox -y
pip3 install pyaudio
git clone https://github.com/Kitt-AI/snowboy.git
cd snowboy/swig/Python3
make
sudo cp snowboydetect.py ../../../../snowboydetect.py
sudo cp _snowboydetect.so ../../../../_snowboydetect.so
cd ../../../
echo "语音唤醒模块配置成功"

echo "开始配置语音播报模块"
sudo apt update
sudo apt-get install libsndfile1-dev libpulse-dev libncurses5-dev libmp3lame-dev libespeak-dev libespeak-ng-dev -y
sudo wget http://sourceforge.net/projects/e-guidedog/files/Ekho/8.6/ekho-8.6.tar.xz
tar xJvf ekho-8.6.tar.xz
cd ekho-8.6
./configure
make
sudo make install
ekho "你好，世界"
cd ../
echo "语音播报模块配置成功"

echo "开始配置语音识别、语义匹配"
pip3 install -r requirements.txt
echo "配置语音识别、语义匹配成功"

echo "还需要配置用以语音识别的onnx库lib路径环境、系统的开机自启动"
echo "该部分需手动配置，详细配置操作参考用户手册"
