@echo off
title Host: %userprofile%
color f0
goto G
:G
title Chat
cls
type chat.dat
goto R

:R
title Chat Host: %userprofile%
ping localhost -n 3 >nul
goto G