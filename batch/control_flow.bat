@echo off
:: If-else example
if exist file.txt (
    echo file.txt exists.
) else (
    echo file.txt does not exist.
)

:: For loop example
for %%i in (1,2,3,4,5) do (
    echo Iteration %%i
)

:: Goto example
goto start
:start
echo Script started.