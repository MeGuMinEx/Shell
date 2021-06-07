#sudo apt-get update
echo "仅支持Debian 10，9，8，7"
result=`lsb_release -a`

target="/etc/apt/sources.list"
echo ======================================
mv /etc/apt/sources.list /etc/apt/sourcesbackup.list
echo "原sources.list文件已在/etc/apt路径下备份为sourcesbackup.list"
echo ======================================
echo $result
echo ======================================
codename=${result##*:}
#截取result变量获取到的内容，从右向左第一个 ： 开始左边全部删除并存入codename变量
echo codename
echo $codename
echo ======================================
echo result
echo ${result##*:}
echo ======================================
	echo "写入中"
	echo ======================================
	echo "deb http://mirrors.ustc.edu.cn/debian/ "${codename}" main non-free contrib" > $target
	echo "deb http://mirrors.ustc.edu.cn/debian/ "${codename}"-proposed-updates main non-free contrib" >> $target
	echo "deb-src http://mirrors.ustc.edu.cn/debian/" ${codename} "main non-free contrib">> $target
	echo "deb-src http://mirrors.ustc.edu.cn/debian/" ${codename}"-proposed-updates main non-free contrib" >>$target
	echo "写入完成"
	echo ======================================
echo "更新软件源"
sudo apt-get update
#更新apt软件源
echo ======================================
echo "升级"
sudo apt-get upgrade
echo ======================================
#执行一次升级
