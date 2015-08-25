call clear.cmd
del *.out
for %%i in ( *.ms.script ) do ..\call.ms.script.exe %%i >> %%i.out