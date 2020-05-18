#!/bin/bash/
#TODO Code encryption
code_path="/home/ubuntu/encry/"
web_path="/home/wwwroot/web/"
log_path="/home/ubuntu/"
mdate=$(date +%Y_%m_%d_%H_%M_%S)
if [ ! -d $web_path ]; then
  mkdir $web_path
  chmod 777 -R $web_path
  cd $code_path
  tar -czf encry.tar.gz app
  tar -zxvf encry.tar.gz -C $web_path
  cd $log_path
  echo "update code       $mdate   " >>encry.log

else
  cd $code_path
  tar -czf encry.tar.gz app
  tar -zxvf encry.tar.gz -C $web_path
  cd $log_path
  echo "update code        $mdate   " >>encry.log

fi
