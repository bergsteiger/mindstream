@echo off
echo "Differing"
echo %~1 
echo %~2
Diff\diff.exe %~1 %~2
pause