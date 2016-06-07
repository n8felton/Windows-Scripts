cscript %WINDIR%\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs -xc

net stop spooler

reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Print Processors" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows NT x86\Print Processors" /f

net start spooler

cscript %WINDIR%\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs -x

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Print Processors\winprint" /v Driver /t reg_sz /d winprint.dll
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows NT x86\Print Processors\winprint" /v Driver /t reg_sz /d winprint.dll

net stop spooler
net start spooler
