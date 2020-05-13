#!/bin/bash
#loader path
loader_file='/home/swoole_loader.so'
#php extension dir
extension_dir='/usr/local/lib/php/extensions/no-debug-non-zts-20170718'
#php.ini path
php_ini_path="/usr/local/etc/php/php.ini"
#copy
cp $loader_file $extension_dir && echo "extension=swoole_loader.so" >> $php_ini_path
