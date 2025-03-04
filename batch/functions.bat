@echo off
call :greet Alice
:: Exits the script subroutinr\e
exit /b

:greet
echo Hello, %1!
exit /b