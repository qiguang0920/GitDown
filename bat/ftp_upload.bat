@echo off
Color a9
echo.               ==========�������ļ�ѹ����FTP�ϴ���ָ��������==========
echo.               ============BY:JIMMY caoqiguang@gmail.com==============
echo.

@echo ����ѹ����ı����ļ���
set backupName=ERP-BACKUP

@echo ������Ҫѹ�����ļ����������ö��
set backupFile=d:\backup\*.bak d:\backup\*.txt

@echo ���ý�ѹ���ļ������ںδ�
set backupFiletoDir=d:\backup

@echo ���ñ���ѹ����ı����ļ���������,��ò�Ҫ����̫�ߣ�����һ�㱣��һ�������ı��ݼ��ɣ��������������С�
set backupDelDate=1

@echo ����winrarĿ¼
set winrarDir=C:\Program Files\WinRAR

@echo ����ftp��������ַ
set ftpServer=192.168.17.200

@echo ����ftp�û���,ע�ⲻҪ���ո�
set ftpUser=user

@echo ����ftp���룬ע�ⲻҪ���ո�
set ftpPasswd=user


@echo ����ע���ʱ���ʽΪyyyy-MM-dd,һ�㲻Ҫ��
Reg add "HKEY_CURRENT_USER\Control Panel\International" /v sShortDate /t REG_SZ /d yyyy-MM-dd /f

@echo ���ø��ļ�����ʱ��ʱ�������һ�㲻Ҫ��
set dateStr=%date:~,4%%date:~5,2%%date:~8,2%0%time:~1,1%%time:~3,2%%time:~6,2%

@echo ɾ��ɾ������X��֮ǰ�ı���
forfiles /p "%backupFiletoDir%" /s /m %backupName%*.RAR /d -%backupDelDate% /c "cmd /c del @path"
echo.
@echo �����ڿ�һ�������޸ģ�����winrar -dfΪѹ����ɾ��Դ�ļ����������Ҫ��ɾ���������,-hpΪѹ���ļ�����
"%winrarDir%\WinRAR.exe" a -df -ep1�Cm5 -ibck -inul�Cpwinrar %backupFiletoDir%\newbackup.rar %backupFile% 2>>error.log
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
