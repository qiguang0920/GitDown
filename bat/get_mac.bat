@echo off
:menu
title ��ﱦͨMAC��ַ�鿴����
CLS
color 18
echo.
echo.
echo.               ==========��ﱦͨMAC��ַ�鿴����==========
echo.               =====BY:JIMMY caoqiguang@gmail.com=========
echo.
echo.
echo. ��ﱦͨMAC��ַ�鿴���ߣ�
echo.
echo. 1 Windows7/10/2008
echo.
echo. 2 Windows XP
echo.
echo. ��������Ĳ���ϵͳѡ��1��2��Ȼ��ȷ����
set /p XUANXIANG= 
if "%XUANXIANG%"=="1" goto 1
if "%XUANXIANG%"=="2" goto 2
echo ���������������������1��2 & pause & goto menu
:1
echo.
echo ��ѡ����Windows7/10/2008

echo �����Ե�����(MAC)��ַΪ:
ipconfig /all |find "�����ַ" |find "00-00-00" /v 
echo.  
echo �����ʾMAC��ַΪ�գ���ȷ����ĵ����Ѿ���װ�������������Ƿ�ѡ������ȷ��ѡ��
echo. & pause 
goto menu

:2
echo ��ѡ����Windows XP
echo.
echo �����Ե�����(MAC)��ַΪ:
ipconfig /all |find "Physical Address" |find "00-00-00" /v
echo.
echo �����ʾMAC��ַΪ�գ���ȷ����ĵ����Ѿ���װ�������������Ƿ�ѡ������ȷ��ѡ��
echo. & pause 
goto menu