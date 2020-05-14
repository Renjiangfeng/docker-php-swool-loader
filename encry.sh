#!/bin/bash/
#TODO  进行文件加密
data_path="/home/ubuntu/encry/"
web_path="/home/wwwroot/web/"
log_path="/home/ubuntu/"
mdate=`date +%Y_%m_%d_%H_%M_%S`
if [ ! -d $web_path ];then
mkdir $web_path
chmod 777 -R $web_path
cd $data_path
tar -czf encry.tar.gz   app
tar -zxvf encry.tar.gz -C $web_path
cd $log_path
echo "更新成功       $mdate   "  >> encry.log
#tar -zxvf 5ebb9dc57078e_encry_linux_7.1.tar.gz -C $web_path
else
cd $data_path
tar -czf encry.tar.gz   app
tar -zxvf encry.tar.gz -C $web_path
cd $log_path
echo "更新成功       $mdate   "  >> encry.log
#tar -zxvf 5ebb9dc57078e_encry_linux_7.1.tar.gz -C $web_path
fi
