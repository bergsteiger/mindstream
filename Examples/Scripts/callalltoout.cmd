call clear.cmd
del *.out
for %%i in ( *.ms.script ) do callMSS.exe %%i >> %%i.out