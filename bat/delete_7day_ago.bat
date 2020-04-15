@echo off
Color a9
echo.               ==========将备份文件N天之前的文件自动删除,并最少保留天的备份=====
echo.               ============BY:JIMMY caoqiguang@gmail.com==============
echo.
rem 初始计数器
set cnt=0
rem 设置将压缩文件放置在何处
set FileDir=F:\Software
rem 删除多少天之前的文件
set DelDate=7
rem 最少保留多少个文件，防止备份计划出问题时，把所有备份删光
set LeastDate=2
for /f "delims=" %%i in ('dir/b/a-d "%FileDir%" 2^>nul') do (set /a cnt+=1
echo %%i
)
if %cnt% GTR %LeastDate% (forfiles /p "%FileDir%" /s /m *.* /d -7 /c "cmd /c del @path") else echo,文件数低于最低保留值%LeastDate%，不执行任何操作。
pause
