@echo off
Color a9
echo.               ==========ɾ���ƶ�Ŀ¼7��֮ǰ���ļ�==========
echo.               =====BY:JIMMY caoqiguang@gmail.com===========
forfiles /p "D:\jimmy\oabak" /s /m *.* /d -7 /c "cmd /c del @path"
forfiles /p "D:\jimmy\erpbak\002" /s /m *.* /d -7 /c "cmd /c del @path"
forfiles /p "D:\jimmy\erpbak\�ڶ�����" /s /m *.* /d -7 /c "cmd /c del @path"
forfiles /p "D:\jimmy\haiyibak\DB" /s /m *.* /d -7 /c "cmd /c del @path"
@exit