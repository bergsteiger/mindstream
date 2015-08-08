call clear.cmd
del a.out
for %%i in ( *.script ) do callMSS.exe %%i >> a.out