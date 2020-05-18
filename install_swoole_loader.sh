#!/bin/bash
#swoole_loader extension file
swoole_extension_file='/home/ubuntu/swoole_loader.so'
#查找 php extension dir （默认的php版本  ，若其他版本： php -i改为path/7.1/php -i）
PHP_EXT_DIR=`php -i | grep "extension_dir" | awk ' /php/  { print $3"/"}'`
# 查找php.ini path（默认的php版本  ，若其他版本： php -i改为path/7.1/php -i）
PHP_INI_PATH=`php -i | grep "php.ini"  | awk   -F ' => ' '$2 ~ /php.ini/  { print $2  }'`


#is_php_install(){
#    if [ $PHP_EXT_DIR ]; then
#      echo "PHP  install"
#    else
#      echo "php no "
#    fi
#}
#判断swool_loader是否加载
php_swool_loader() {
  if
    php -i | grep "swoole_loader"
  then
    echo 'swool_loader is enabled'
  else
    update_swoole_loader
  fi
}
#load  swool_loader
update_swoole_loader(){
  if [ $(grep -w ";extension=swoole_loader.so" $PHP_INI_PATH) ];   then
      sed -i '/;extension=swoole_loader.so/d'  $PHP_INI_PATH && echo "extension=swoole_loader.so" >> $PHP_INI_PATH
      echo "swoole_loader was installed successfully!"
    else
#      echo 'no'
      cp $swoole_extension_file $PHP_EXT_DIR && echo "extension=swoole_loader.so" >> $PHP_INI_PATH
      echo "swoole_loader was installed successfully!"
  fi
}

php_swool_loader

#sudo sed -i '/;extension=swoole_loader.so/d' /usr/local/php/etc/php.ini && echo "extension=swoole_loader.so" >> /usr/local/php/etc/php.ini
#sudo sed -i 's/;extension=swoole_loader.so/extension=swoole_loader.so' /usr/local/php/etc/php.ini
# grep -wq ";extension=swoole_loader.so" /usr/local/php/etc/php.ini && echo 'yes' || echo 'no'

# php -i | grep "php.ini"  | awk '/ini/'  -F ' => ' '{ print $2  }'
#
# php -i | grep "extension_dir" | awk ' /php/  { print $3"/"}'  && echo 'yes' || echo 'no'
#
#php -v | grep php && echo 1 || echo 2
