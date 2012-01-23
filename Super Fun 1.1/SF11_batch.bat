@echo off
@cls
echo                      ================
echo                      ==Super Fun V1.1==
echo                      ================
echo Press enter to start
pause > nul
echo =#=Login=#=
echo Name:
set /p Name=
echo Password:
set /p Password=
if %Name%=user and %password%=user then
goto ok
echo %name%
echo %password%
pause
ok
echo Login OK!
pause