set outputfile=C:\stuff\%computername%.txt

date /t > %outputfile%
echo %computername% >> %outputfile%
systeminfo >> %outputfile%
net localgroup administrators >> %outputfile%
net user >> %outputfile%
net share >> %outputfile%

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /f /t REG_SZ /d c:\stuff\maxresdefault.jpg
