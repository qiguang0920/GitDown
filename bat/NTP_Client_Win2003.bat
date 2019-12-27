@echo off
@ ECHO.                               说   明
@ ECHO --------------------------------------------------------------------------
@ Echo		修正windows 2003与非 Windows NTP服务器同步时出错问题
@ Echo 		请将172.16.88.13修改成你的NTP服务器地址
@ Echo 		请不要在非windows 2003以外的系统执行
@ ECHO --------------------------------------------------------------------------
@ ECHO.
pause
w32tm /config /manualpeerlist:172.16.88.13,0x8 /syncfromflags:MANUAL
net stop w32time
rem 设置时间校正间隔时间3600秒
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\W32Time\TimeProviders\NtpClient /v SpecialPollInterval /t reg_dword /d 3600 /f

reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\W32Time\TimeProviders\NtpClient /v SpecialPollTimeRemaining /t reg_multi_sz /d 172.16.88.13,0 /f

net start w32time
w32tm /resync