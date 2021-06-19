input(){
echo ======================================
echo "1.清华源"
echo "2.中科大"
echo "3.163"
echo "4.华为云"
echo "5.腾讯云"
echo "6.阿里云"
echo "7.兰州大学"
echo "8.交通大学"
echo ======================================
#echo "请输入数字选择源："
read -p "输入数字选择源：" ipn
echo $ipn
#接收输入
}
out(){
 echo "写入中"
        echo ======================================
        echo "deb http://mirrors."${url}"/debian/ "${codename}" main non-free contrib" > $target
	#echo ================================================================================================
	#echo "deb http://mirrors."${url}"/debian/ "${codename}" main non-free contrib"
	#echo ================================================================================================
	#echo "deb http://mirrors.ustc.edu.cn/debian/ "${codename}"-proposed-updates main non-free contrib"
	#echo ================================================================================================
	#echo "deb http://mirrors.ustc.edu.cn/debian/ "${codename}" main non-free contrib" > $target
	echo "deb http://mirrors."${url}"/debian/ "${codename}"-proposed-updates main non-free contrib" >> $target
        echo "deb-src http://mirrors."${url}"/debian/" ${codename} "main non-free contrib" >> $target
        echo "deb-src http://mirrors."${url}"/debian/" ${codename}"-proposed-updates main contrib non-free"  >> $target
        echo "写入完成"
        echo ======================================
#输出到文件
}

selects(){
case $ipn in
	1)
	url="tuna.tsinghua.edu.cn" 
	echo "清华大学"
	;;
	2)
	url="ustc.edu.cn"
	echo "中科大"
	;;
	3)
	url="163.com"
	echo "163"
	;;
	4)
	url="huaweicloud.com"
	echo "华为云"
	;;
	5)
	url="cloud.tencent.com"
	echo "腾讯云"
	;;
	6)
	url="aliyun.com"
	echo "阿里云"
	;;
	7)
	url="lzu.edu.cn"
	echo "兰州大学"
	;;
	8)
	url="sjtug.sjtu.edu.cn"
	echo "上海交大"
	;;
esac
#接收输入为url变量赋值
}

#sudo apt-get update
echo "仅支持Debian 10，9，8，7"
result=`lsb_release -a`
input
selects
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
out
#	echo "写入中"
#	echo ======================================
#	echo "deb http://mirrors.ustc.edu.cn/debian/ "${codename}" main non-free contrib" > $target
#	echo "deb http://mirrors.ustc.edu.cn/debian/ "${codename}"-proposed-updates main non-free contrib" >> $target
#	echo "deb-src http://mirrors.ustc.edu.cn/debian/" ${codename} "main non-free contrib">> $target
#	echo "deb-src http://mirrors.ustc.edu.cn/debian/" ${codename}"-proposed-updates main non-free contrib" >>$target
#	echo "写入完成"
#	echo ======================================
#echo "更新软件源"
sudo apt-get update
#更新apt软件源
echo ======================================
echo "升级"
echo ======================================
sudo apt-get upgrade

#执行一次升级



