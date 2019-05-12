
cd E://VsCode//bfi-vsvode


yarn run gulp -- vscode-win32-x64

if [ $? -ne 0 ]; then

	echo "打包失败"


else


	echo "打包成功"
	

cp -r E://VsCode//extensions E://VsCode//VSCode-win32-x64//resources//app//


cp -r E://VsCode//MinGW64 E://VsCode//VSCode-win32-x64//


	if [ ! -d "E://VsCode//1024IDE-win32-x64-alpha" ];then

		echo "文件不存在,创建文件"

		mkdir E://VsCode//1024IDE-win32-x64-alpha

	else

		echo "文件夹已经存在"

	fi


cp -r E://VsCode//VSCode-win32-x64 E://VsCode//1024IDE-win32-x64-alpha


cd E://VsCode//1024IDE-win32-x64-alpha


mv VSCode-win32-x64 1024ide-win32-x64


cp E://VsCode//vscode_back/*  E://VsCode//1024IDE-win32-x64-alpha//1024ide-win32-x64

fi