@echo off
@ ECHO.                               ˵   ��
@ ECHO --------------------------------------------------------------------------
@ Echo		����windows 2003��� Windows NTP������ͬ��ʱ��������
@ Echo 		�뽫172.16.88.13�޸ĳ����NTP��������ַ
@ Echo 		�벻Ҫ�ڷ�windows 2003�����ϵͳִ��
@ ECHO --------------------------------------------------------------------------
@ ECHO.
pause
w32tm /config /manualpeerlist:172.16.88.13,0x8 /syncfromflags:MANUAL
net stop w32time
rem ����ʱ��У�����ʱ��3600��
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\W32Time\TimeProviders\NtpClient /v SpecialPollInterval /t reg_dword /d 3600 /f

reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\W32Time\TimeProviders\NtpClient /v SpecialPollTimeRemaining /t reg_multi_sz /d 172.16.88.13,0 /f

net start w32time
w32tm /resync