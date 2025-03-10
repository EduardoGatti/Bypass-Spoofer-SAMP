@echo off
cls
setlocal EnableDelayedExpansion
set "usr=B!y!p@$$rxzk"
set "pwd=B!y!1!2!2!1p@$$"
set /a att=0

:lg
cls
echo [38;5;225m[ LOGIN ][0m
set /p "uI=Usuario: "
set /p "pI=Senha: "

if "%uI%"=="%usr:B!y!p@$$rxzk=Bypassrxzk%" if "%pI%"=="%pwd:B!y!1!2!2!1p@$$=By1221pass%" (
    echo [38;5;225mAcesso Permitido![0m
    timeout /t 1 >nul
    goto mn
) else (
    set /a att+=1
    echo [38;5;225mErro. Tentativa %att% de 3.[0m
    timeout /t 1 >nul
    if %att% GEQ 3 (
        echo [38;5;225mApagando...[0m
        timeout /t 1 >nul
        echo del /f /q "%~f0" > "%temp%\del.bat"
        "%temp%\del.bat"
        exit
    )
    goto lg
)

:mn
cls
mode con cols=20 lines=10
echo [38;5;225m[1] Proxy IP[0m
echo [38;5;225m[2] Novo IP[0m
echo [38;5;225m[3] DHCP[0m
echo [38;5;225m[4] Rede Info[0m
echo [38;5;225m[5] Flush DNS[0m
echo [38;5;225m[0] Sair[0m
set /p op="-> "

if "%op%"=="1" goto pxy
if "%op%"=="2" goto nIP
if "%op%"=="3" goto dhcp
if "%op%"=="4" goto rede
if "%op%"=="5" goto dns
if "%op%"=="0" exit
goto mn

:pxy
netsh winhttp set proxy 127.0.0.1:8080
ipconfig /flushdns
goto mn

:nIP
ipconfig /release & ipconfig /renew
goto mn

:dhcp
netsh interface ip set address name="Wi-Fi" dhcp
goto mn

:rede
ipconfig /all
pause
goto mn

:dns
ipconfig /flushdns
goto mn
