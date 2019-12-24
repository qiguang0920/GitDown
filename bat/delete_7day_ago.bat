@echo off
Color a9
echo.               ==========删除制定目录7天之前的文件==========
echo.               =====BY:JIMMY caoqiguang@gmail.com===========
forfiles /p "D:\jimmy\oabak" /s /m *.* /d -7 /c "cmd /c del @path"
forfiles /p "D:\jimmy\erpbak\002" /s /m *.* /d -7 /c "cmd /c del @path"
forfiles /p "D:\jimmy\erpbak\第二账套" /s /m *.* /d -7 /c "cmd /c del @path"
forfiles /p "D:\jimmy\haiyibak\DB" /s /m *.* /d -7 /c "cmd /c del @path"
@exit