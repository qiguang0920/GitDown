@echo off
CLS
title ͼƬץȡ����
color 18
:start
rem ���ò�����Ŀ¼
set "PathName=E:\REC" 

rem ������ִ�� %%iΪ������Ŀ¼ %%bΪ��Ҫ������ĵ���ͼƬ
for %%i in (%PathName%) do for /f "delims=" %%b in ('dir /a-d/b/s "%%i\*.pptx"') do ( 
rem	�г������ļ�����ǰĿ¼�µ�list.txt
	echo %%b>>list.txt

rem ���Ƶ�ָ��Ŀ¼
	move "%%b" "E:\pptx" 
) 
for %%i in (%PathName%) do for /f "delims=" %%b in ('dir /a-d/b/s "%%i\*.ppt"') do ( 
rem	�г������ļ�����ǰĿ¼�µ�list.txt
	echo %%b>>list.txt

rem ���Ƶ�ָ��Ŀ¼
	move "%%b" "E:\pptx" 
) 


