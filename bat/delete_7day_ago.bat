@echo off
Color a9
echo.               ==========�������ļ�N��֮ǰ���ļ��Զ�ɾ��,�����ٱ�����ı���=====
echo.               ============BY:JIMMY caoqiguang@gmail.com==============
echo.
rem ��ʼ������
set cnt=0
rem ���ý�ѹ���ļ������ںδ�
set FileDir=F:\Software
rem ɾ��������֮ǰ���ļ�
set DelDate=7
rem ���ٱ������ٸ��ļ�����ֹ���ݼƻ�������ʱ�������б���ɾ��
set LeastDate=2
for /f "delims=" %%i in ('dir/b/a-d "%FileDir%" 2^>nul') do (set /a cnt+=1
echo %%i
)
if %cnt% GTR %LeastDate% (forfiles /p "%FileDir%" /s /m *.* /d -7 /c "cmd /c del @path") else echo,�ļ���������ͱ���ֵ%LeastDate%����ִ���κβ�����
pause
