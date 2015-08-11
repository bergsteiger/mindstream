call clear.cmd
del *.out
for %%i in ( *.script ) do call.ms.script.exe %%i >> %%i.out