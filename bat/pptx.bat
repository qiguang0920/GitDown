@echo off
CLS
title 图片抓取程序
color 18
:start
rem 设置查找主目录
set "PathName=E:\REC" 

rem 主功能执行 %%i为所有子目录 %%b为需要输出的文档或图片
for %%i in (%PathName%) do for /f "delims=" %%b in ('dir /a-d/b/s "%%i\*.pptx"') do ( 
rem	列出所有文件到当前目录下的list.txt
	echo %%b>>list.txt

rem 复制到指定目录
	move "%%b" "E:\pptx" 
) 
for %%i in (%PathName%) do for /f "delims=" %%b in ('dir /a-d/b/s "%%i\*.ppt"') do ( 
rem	列出所有文件到当前目录下的list.txt
	echo %%b>>list.txt

rem 复制到指定目录
	move "%%b" "E:\pptx" 
) 


