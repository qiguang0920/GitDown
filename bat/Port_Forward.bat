@echo off
CLS
Color a9
echo.               ==========Windows端口转发批处理，需管理员运行==========
echo.               ============BY:JIMMY caoqiguang@gmail.com==============
echo.
:menu
color 18
echo. 请选择您需要的操作：
echo.
echo. 1 设置端口转发
echo.
echo. 2 清除端口设置
echo.
echo. 3 查看转发设置
echo.
echo. 请根据您的系统选择1或2或3：
set /p XUANXIANG= 
if "%XUANXIANG%"=="1" goto 1
if "%XUANXIANG%"=="2" goto 2
if "%XUANXIANG%"=="3" goto 3
echo 输入错误，选择正确的选项 & pause & goto menu

:1
set /p local_ip= 请输入本地IP地址:
echo %local_ip%|findstr "[^0-9,.]" >nul&&goto 1
set /p connect_ip= 请输入目标IP地址:
echo %connect_ip%|findstr "[^0-9,.]" >nul&&goto 1
netsh interface portproxy add v4tov4  listenport=31400 listenaddress=%local_ip%  connectport=31400 connectaddress=%connect_ip%
netsh interface portproxy add v4tov4  listenport=31401 listenaddress=%local_ip%  connectport=31401 connectaddress=%connect_ip%
netsh interface portproxy add v4tov4  listenport=31402 listenaddress=%local_ip%  connectport=31402 connectaddress=%connect_ip%
netsh interface portproxy add v4tov4  listenport=31403 listenaddress=%local_ip%  connectport=31403 connectaddress=%connect_ip%
netsh interface portproxy add v4tov4  listenport=31404 listenaddress=%local_ip%  connectport=31404 connectaddress=%connect_ip%
netsh interface portproxy add v4tov4  listenport=31405 listenaddress=%local_ip%  connectport=31405 connectaddress=%connect_ip%
netsh interface portproxy add v4tov4  listenport=31406 listenaddress=%local_ip%  connectport=31406 connectaddress=%connect_ip%
netsh interface portproxy add v4tov4  listenport=31407 listenaddress=%local_ip%  connectport=31407 connectaddress=%connect_ip%
netsh interface portproxy add v4tov4  listenport=31408 listenaddress=%local_ip%  connectport=31408 connectaddress=%connect_ip%
netsh interface portproxy add v4tov4  listenport=31409 listenaddress=%local_ip%  connectport=31409 connectaddress=%connect_ip%
echo 端口转发完成
echo. & pause 
goto menu

:2
netsh interface portproxy reset
清除设置完成
echo. & pause 
goto menu

:3
echo 此处显示已经配置的转发规则，如为空则是没有设置
netsh interface portproxy show all
echo. & pause 
goto menu

