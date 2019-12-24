@echo off
Color a9
echo.               ==========将备份文件压缩并FTP上传到指定服务器==========
echo.               ============BY:JIMMY caoqiguang@gmail.com==============
echo.

@echo 设置压缩后的备份文件名
set backupName=ERP-BACKUP

@echo 设置需要压缩的文件，可以设置多个
set backupFile=d:\backup\*.bak d:\backup\*.txt

@echo 设置将压缩文件放置在何处
set backupFiletoDir=d:\backup

@echo 设置本机压缩后的备份文件保存天数,最好不要设置太高，本地一般保留一天或两天的备份即可，反正服务器上有。
set backupDelDate=1

@echo 设置winrar目录
set winrarDir=C:\Program Files\WinRAR

@echo 设置ftp服务器地址
set ftpServer=192.168.17.200

@echo 设置ftp用户名,注意不要留空格
set ftpUser=user

@echo 设置ftp密码，注意不要留空格
set ftpPasswd=user


@echo 设置注册表时间格式为yyyy-MM-dd,一般不要改
Reg add "HKEY_CURRENT_USER\Control Panel\International" /v sShortDate /t REG_SZ /d yyyy-MM-dd /f

@echo 设置给文件命名时的时间变量，一般不要改
set dateStr=%date:~,4%%date:~5,2%%date:~8,2%0%time:~1,1%%time:~3,2%%time:~6,2%

@echo 删除删除本机X天之前的备份
forfiles /p "%backupFiletoDir%" /s /m %backupName%*.RAR /d -%backupDelDate% /c "cmd /c del @path"
echo.
@echo 以下内空一般无需修改，其中winrar -df为压缩后删除源文件，如果不需要请删除这个参数,-hp为压缩文件密码
"%winrarDir%\WinRAR.exe" a -df -ep1–m5 -ibck -inul–pwinrar %backupFiletoDir%\newbackup.rar %backupFile% 2>>error.log
ren "%backupFiletoDir%\newbackup.rar" "%backupName%-%dateStr%.RAR"
del %temp%\ftpconf.ftp
echo %ftpUser%>>%temp%\ftpconf.ftp
echo %ftpPasswd%>>%temp%\ftpconf.ftp
echo mput %backupFiletoDir%\%backupName%*.RAR >>%temp%\ftpconf.ftp
echo close>>%temp%\ftpconf.ftp
echo quit>>%temp%\ftpconf.ftp
ftp -i -s:%temp%\ftpconf.ftp %ftpServer% 2>>error.log
del %temp%\ftpconf.ftp
@exit
