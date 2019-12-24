@echo off
CLS
title 视频抓取程序
color 18
:start
rem 设置查找主目录
set "PathName=E:\" 

rem 主功能执行 %%i为所有子目录 %%b为需要输出的文档或图片
for %%i in (%PathName%) do for /f "delims=" %%b in ('dir /a-d/b/s "%%i\*.jpg"') do ( 
rem	列出所有文件到当前目录下的list.txt
rem	echo %%b>>list.txt
if exist %%b (　　　　　　　　::注意这里else后的空格
　　echo 有图片未确认
)else (
　　echo 暂时未有新图片
)	
rem 复制到指定目录
	move "%%b" "D:\image" 
) 
choice /t 3 /d y /n >nul
goto start
