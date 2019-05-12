#!/bin/bash

DATE=$(date +%Y%m%d)
time=$(date "+%Y-%m-%d %H:%M:%S")

mysqldump -uroot -p123456 --databases bfi eluzhupms lms > dump$DATE.sql
scp dump$DATE.sql root@192.168.126.128:/home/youcong/mysql_backed
rm -r dump$DATE.sql
if [ $? -eq 0 ]
then
  echo "成功备份mysql数据库,当前日期为:"$time >> /home/test/script/mysql_dump.log

else

  echo "备份mysql数据库失败:当前日期为:"$time>> /home/test/script/mysql_dump.log

fi
