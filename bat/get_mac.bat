@echo off
:menu
title 万达宝通MAC地址查看工具
CLS
color 18
echo.
echo.
echo.               ==========万达宝通MAC地址查看工具==========
echo.               =====BY:JIMMY caoqiguang@gmail.com=========
echo.
echo.
echo. 万达宝通MAC地址查看工具：
echo.
echo. 1 Windows7/10/2008
echo.
echo. 2 Windows XP
echo.
echo. 请根据您的操作系统选择1或2，然后确定：
set /p XUANXIANG= 
if "%XUANXIANG%"=="1" goto 1
if "%XUANXIANG%"=="2" goto 2
echo 输入错误，请重新输入数字1或2 & pause & goto menu
:1
echo.
echo 您选择是Windows7/10/2008

echo 您电脑的物理(MAC)地址为:
ipconfig /all |find "物理地址" |find "00-00-00" /v 
echo.  
echo 如果显示MAC地址为空，请确认你的电脑已经安装了网卡驱动或是否选择了正确的选项
echo. & pause 
goto menu

:2
echo 您选择是Windows XP
echo.
echo 您电脑的物理(MAC)地址为:
ipconfig /all |find "Physical Address" |find "00-00-00" /v
echo.
echo 如果显示MAC地址为空，请确认你的电脑已经安装了网卡驱动或是否选择了正确的选项
echo. & pause 
goto menu