@echo off
CLS
title ��Ƶץȡ����
color 18
:start
rem ���ò�����Ŀ¼
set "PathName=E:\" 

rem ������ִ�� %%iΪ������Ŀ¼ %%bΪ��Ҫ������ĵ���ͼƬ
for %%i in (%PathName%) do for /f "delims=" %%b in ('dir /a-d/b/s "%%i\*.jpg"') do ( 
rem	�г������ļ�����ǰĿ¼�µ�list.txt
rem	echo %%b>>list.txt
if exist %%b (����������������::ע������else��Ŀո�
����echo ��ͼƬδȷ��
)else (
����echo ��ʱδ����ͼƬ
)	
rem ���Ƶ�ָ��Ŀ¼
	move "%%b" "D:\image" 
) 
choice /t 3 /d y /n >nul
goto start
