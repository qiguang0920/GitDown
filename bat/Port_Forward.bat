@echo off
CLS
Color a9
echo.               ==========Windows�˿�ת�������������Ա����==========
echo.               ============BY:JIMMY caoqiguang@gmail.com==============
echo.
:menu
color 18
echo. ��ѡ������Ҫ�Ĳ�����
echo.
echo. 1 ���ö˿�ת��
echo.
echo. 2 ����˿�����
echo.
echo. 3 �鿴ת������
echo.
echo. ���������ϵͳѡ��1��2��3��
set /p XUANXIANG= 
if "%XUANXIANG%"=="1" goto 1
if "%XUANXIANG%"=="2" goto 2
if "%XUANXIANG%"=="3" goto 3
echo �������ѡ����ȷ��ѡ�� & pause & goto menu

:1
set /p local_ip= �����뱾��IP��ַ:
echo %local_ip%|findstr "[^0-9,.]" >nul&&goto 1
set /p connect_ip= ������Ŀ��IP��ַ:
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
echo �˿�ת�����
echo. & pause 
goto menu

:2
netsh interface portproxy reset
����������
echo. & pause 
goto menu

:3
echo �˴���ʾ�Ѿ����õ�ת��������Ϊ������û������
netsh interface portproxy show all
echo. & pause 
goto menu

