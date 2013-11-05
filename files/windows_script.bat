set outputfile=C:\audit\%computername%.txt

date /t > %outputfile%
echo %computername% >> %outputfile%
systeminfo >> %outputfile%
net localgroup administrators >> %outputfile%
net user >> %outputfile%
net share >> %outputfile%

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /f /t REG_SZ /d c:\images\maxresdefault.jpg
