DATE=$(date +%Y%m%d)

time=$(date "+%Y-%m-%d %H:%M:%S")

git clone https://code.aliyun.com/test/blog.git

cd blog

mvn clean package

if [ $? -ne 0 ]; then

    echo "自动化部署blog项目失败,当前日期为:"$time >> /home/project/blog_deploy.log
    echo '部署失败，请登录服务器查看' | mail -s "blog部署" test@163.com
else

    cp -r /home/project/blog/target/blog.war /home/project/tomcat8/webapps/

    /home/project/tomcat8/bin/shutdown.sh

    /home/project/tomcat8/bin/startup.sh

    rm -r /home/project/blog

    echo "自动化部署blog项目成功,当前日期为:"$time >> /home/project/blog_deploy.log
    echo '部署成功' | mail -s "blog部署" test@163.com

fi