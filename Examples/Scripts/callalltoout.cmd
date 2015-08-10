call clear.cmd
del *.out
for %%i in ( *.mss ) do callMSS.exe %%i >> %%i.out