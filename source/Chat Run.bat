@echo off
color f0
title Debug
echo Setting Admins
set admin1=Kade
set admin2=None
set admin3=None
echo Setting Dir
set dirworking=%userprofile%\Documents\chat
echo Setting Debug
set debug=Off
echo Setting If the chat is public
set chatpublic=On
echo If statments
if %debug%==On goto debug
if %chatpublic%==On goto debug2
if %debug%==Off goto title
ping localhost -n 1 >nul
echo Debug was not set!
ping localhost -n 3 >nul
exit
:debug2
set debug=Disabled
goto title
:debug
echo Setting Up The Chat Because Debug is %debug% 
pause >nul
echo Admins:
echo Admin 1 is %admin1%
echo Admin 2 is %admin2%
echo Admin 3 is %admin3%
pause >nul
echo The working dir is 1 is %dirworking%
pause >nul
echo Ready!
pause >nul
goto title

:title
title Chat Room By Kade
:chat
color f0
cls
echo.
echo Chat Accounts
echo =============
echo.
echo [1] Log In
echo [2] Sign Up
echo [3] Exit
echo.
set /p op=
if %op%==1 goto 1
if %op%==2 goto 2
if %op%==3 goto 3
goto error
:2
cls
echo Sign Up
echo ======================================
echo.
set /p newname="Enter new username:"
if "%newname%"=="%newname%" goto inputname
:inputname
if exist "chatroomadmin" goto skip
if not exist "chatroomadmin" goto noskip
:noskip
md "chatroomadmin"
goto skip
:skip
cd "chatroomadmin"
if exist "%newname%.bat" goto namexist
if not exist "%newname%.bat" goto skip2
:skip2
echo set realusername=%newname%> "%newname%.bat"
goto next
:next
echo.
set /p pswd=Enter new Password:
if "%pswd%"=="%pswd%" goto inputpass
:inputpass
cd "chatroomadmin"
echo set password=%pswd%>> "%newname%.bat"
goto next1
:namexist
echo.
echo The entered username already exists.
echo Press any key to return. . .
pause >nul
goto 2
:next1
cls
echo Chat Account
echo ============
echo.
echo Your account has been successfully created!
echo.
echo set user=okay>> "%newname%.bat"
pause
goto chat
:1
cls
echo Chat Accounts Log In
echo ================================
echo.
Set /p logname=Username:
if "%logname%"=="%logname%" goto 2.1
:2.1
echo.
set /p logpass="Password:"
if "%logpass%"=="%logpass%" goto login
:login
cd "chatroomadmin"
if exist "%logname%.bat" goto call
if not exist "%logname%.bat" goto errorlog
:call
call "%logname%.bat"
if "%password%"=="%logpass%" goto logdone
goto errorlog
:errorlog
color 0c
echo.
echo Username or Password incorrect.
echo Access denied.
pause >nul
goto chat
:logdone
if "%user%"== "None" goto E1
if "%user%"== "banned" goto B3
cd "%dirworking%"
cls
echo Chat Room
echo ==============
echo.
echo Successfully logged in!
echo.
pause
goto s

:S
if "%user%"== "None" goto E1
if "%user%"== "banned" goto B3
echo Server: %realusername% Joined The Chat >> chat.dat
cd
start chath.bat
color f0
goto A
:A
if "%user%"== "None" goto E1
if "%user%"== "banned" goto B3
cls
echo.
echo Welcome! %realusername%
echo.
set /p say=Say: 
if "%say%"== "!c" goto C
if "%say%"== "!r" goto R
if "%say%"== "!ban" goto B
if "%user%"== "banned" goto B3
echo User: %realusername%: %say% >> chat.dat
echo Sent
ping localhost -n 1 >nul
goto A

:R
if %realusername%==%admin1% goto R2
echo No Admin
ping localhost -n 2 >nul
goto A

:R2
cls
del "chat.dat"
echo [Server Refreshed]>> chat.dat
goto A

:C
cls
echo Command Help.
echo Commands:
echo !r "Refresh." Admin
echo !c "Commands." All
echo !ban "Bans a user" Admin
ping localhost -n 2 >nul
echo Press any key to chat
pause >nul
cls
goto A

:B
if %realusername%==%admin1% goto B2
echo No Admin
ping localhost -n 2 >nul
goto A

:B2
cls
echo Ban A User!
set /p ban=
if not exist "%ban%.bat" goto E2
goto B4

:B5
echo Server: Banned %ban% >> chat.dat
goto A

:B3
cls
color 0c
echo Error Code 002
echo %user% Is Banned
ping localhost -n 2 >nul
echo Press any key to login
pause >nul
goto chat

:b4
cd "chatroomadmin"
echo set user=banned>> "%ban%.bat"
start "%ban%.bat%
cd "%dirworking%"
goto B5

:E1
cls
color 0c
echo Error Code 001
echo %user% Is Not Available
ping localhost -n 2 >nul
echo Press any key to login
pause >nul
goto :chat

:E2
color 0c
echo Error Code 003
echo %ban% Does not exist
ping localhost -n 2 >nul
echo Press any key to chat
pause >nul
goto :A
