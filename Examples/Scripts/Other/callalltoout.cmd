call clear.cmd
del *.out
for %%i in ( *.script ) do callMSS.exe %%i >> %%i.out