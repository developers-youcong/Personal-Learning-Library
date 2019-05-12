time=$(date "+%Y-%m-%d %H:%M:%S")

git clone https://code.aliyun.com/test/bfi.git

cd /home/project/bfi/bfi-saas/bfi-web/src

rm -r ./test/

cd /home/project/bfi/bfi-saas

mvn clean package

if [ $? -ne 0 ]; then

    echo "自动化部署bfi项目失败,当前日期为:"$time >> /home/project/bfi_deploy.log

    echo '部署失败，请登录服务器查看' | mail -s "bfi部署" test@163.com

else

    cp -r /home/project/bfi/bfi-saas/bfi-web/target/bfi-web.war /home/project/tomcat8/webapps/

    /home/project/tomcat8/bin/shutdown.sh

    /home/project/tomcat8/bin/startup.sh

    rm -r /home/project/bfi

    echo "自动化部署bfi项目成功,当前日期为:"$time >> /home/project/bfi_deploy.log
    
    echo '部署成功' | mail -s "bfi部署" test@163.com

fi