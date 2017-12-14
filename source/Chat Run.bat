@echo off
color f0
title Debug
echo Setting Dir
set dirworking=%userprofile%\Desktop\Chat\Chat Backup 2.0\source
echo Setting Admins
set superadmin=Kade
set superadmin2=None
set superadmin3=None
set saveadmin=%userprofile%\Desktop\Chat\Chat Backup 2.0\source\AdminSaves
echo Setting Admin Dir
set ad="chatroomadmin"
echo Setting Debug
set debug=Off
echo Setting If the chat is public
set chatpublic=On
echo If statments
if %chatpublic%==On goto debug2
if %debug%==On goto debug
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
cd %dirworking%
if exist %ad% goto skip
if not exist %ad% goto noskip
:noskip
cd %ad%
goto skip
:skip
cd %ad%
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
cd %ad%
echo set admin=no>> "%newname%.bat"
echo set admintoken=no>> "%newname%.bat"
echo set user=okay>> "%newname%.bat"
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
color f0
cd %ad%
if "%user%"== "None" goto E1
if "%user%"== "banned" goto B3
echo Server: %realusername% Joined The Chat >> chat.dat
cd
start chath.bat
color f0
goto A
:A
color f0
cd %dirworking%
cd %ad%
color f0
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
if "%say%"== "!sa" goto SA
if "%say%"== "!cr" goto E3
if "%say%"== "!ra" goto RA
if "%user%"== "banned" goto B3
if "%user%"== "okay" goto send
:send
echo User: %realusername%: %say% >> chat.dat
goto A


:SA
cd %dirworking%
call "%realusername%.bat"
cls
if "%user%"== "banned" goto B3
if %realusername%==%superadmin% goto SA2
if %realusername%==%superadmin2% goto SA2
if %realusername%==%superadmin3% goto SA2
goto E5
:SA2
cls
cd %dirworking%
cd %ad%
cls
echo Set a admin account!
set /p admin=
if not exist "%admin%.bat" goto E2
goto SA3

:SA3
echo set admin=yes>> "%admin%.bat"
echo set admintoken=%random%>> "%admin%.bat"
cd %saveadmin%
echo set adminauth=auth>> "%admin%.bat"
cd %dirworking%
cd %ad%
echo Done~!
ping localhost -n 2 >nul
echo Press any key to chat
pause >nul













:R
cd %dirworking%
call "%realusername%.bat"
if "%user%"== "banned" goto B3
cd %saveadmin%
if not exist "%realusername%.bat" goto E4
call "%realusername%.bat"
if "%adminauth%"== "auth" R2


:R2
cd %dirworking%
cd %ad%
cls
del "chat.dat"
echo [Server Refreshed]>> chat.dat
goto A












:C
cd %dirworking%
call "%realusername%.bat"
if "%user%"== "banned" goto B3
cls
echo Command Help.
echo Commands:
echo !r "Refresh." Admin
echo !c "Commands." All
echo !ban "Bans a user" Admin
echo !sa "Sets a admin" SuperAdmin
echo !ra "Removes a admin" SuperAdmin
echo !cr "Shows the credits :D" All
ping localhost -n 2 >nul
echo Press any key to chat
pause >nul
cls
goto A



:RA
cls
if "%user%"== "banned" goto B3
if %realusername%==%superadmin% goto RA2
if %realusername%==%superadmin2% goto RA2
if %realusername%==%superadmin3% goto RA2
goto E5

:RA2
cls
cd %saveadmin%
cls
echo Remove a admin account!
set /p admin=
if not exist "%admin%.bat" goto E2
goto RA3

:RA3
cd %dirworking%
cd %ad%
echo set admin=no>> "%admin%.bat"
echo set admintoken=no>> "%admin%.bat"
cd %saveadmin%
echo set adminauth=noauth>> "%admin%.bat"
cd %dirworking%
cd %ad%
echo Done~!
ping localhost -n 2 >nul
echo Press any key to chat
pause >nul
goto A



















:B
cd %dirworking%
call "%realusername%.bat"
if "%user%"== "banned" goto B3
cd %saveadmin%
if not exist "%realusername%.bat" goto E4
call "%realusername%.bat"
if "%adminauth%"== "auth" goto B2


:B2
cd %dirworking%
cd %ad%
set errorcode=ban
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
echo %realusername% Is Banned
ping localhost -n 2 >nul
echo Press any key to login
pause >nul
goto chat

:b4
echo set user=banned>> "%ban%.bat"
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
cls
color 0c
echo Error Code 003
echo The User You Entered Does Not Exist
ping localhost -n 2 >nul
echo Press any key to chat
pause >nul
goto :A

:E3
cls
echo Credits:
color 19
ping localhost -n 1 >nul
color 3B
echo Created by KadeIsWeebNerd#2000
ping localhost -n 1 >nul
color 5D
echo Sourced From CMD Login And Simple Batch Chat.
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color 3B
ping localhost -n 1 >nul
color 5D
ping localhost -n 1 >nul
color 19
ping localhost -n 1 >nul
color f0
echo Press any key to chat
pause >nul
goto A




:E4
cls
echo No Admin
ping localhost -n 2 >nul
goto A:E4
cls
echo No Admin
ping localhost -n 2 >nul
goto A

:E5
cls
echo No Super Admin
ping localhost -n 2 >nul
goto A
