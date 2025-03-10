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
        attrib +h "%temp%\del.bat"
        "%temp%\del.bat"
        exit
    )
    goto lg
)
:menu
cls
:: Definir tamanho da janela (largura x altura)
mode con cols=46 lines=22

:: Título
echo [38;5;32m╔══════════════ ═════════════════════════════╗[0m
echo [38;5;32m║                   BYPASS.exe               ║[0m
echo [38;5;32m╚════════════════════════════════════════════╝[0m
echo.

:: Menu de opções colorido com RGB
echo [38;5;196m[1][0m Limpar LogBag
echo [38;5;214m[2][0m Limpar Logs do Sistema
echo [38;5;226m[3][0m Limpar ShallBag
echo [38;5;46m[4][0m Limpar Prefetch
echo [38;5;45m[5][0m Limpar Journal
echo [38;5;33m[6][0m Limpar Histórico do Chrome
echo [38;5;199m[7][0m Limpar Histórico de Downloads
echo [38;5;28m[8][0m Limpar Tudo
echo [38;5;69m[9][0m Excluir Arquivo Específico
echo [38;5;39m[10][0m Limpar Arquivos de Atualização do Windows
echo [38;5;50m[11][0m Limpar Lixeira
echo [38;5;68m[12][0m Limpar Cache do Sistema
echo [38;5;75m[13][0m Abrir Limpeza de Dados do Chrome
echo [38;5;106m[14][0m Limpar Histórico do Firefox
echo [38;5;87m[15][0m Reiniciar o explorer.exe
echo [38;5;82m[0][0m Sair
echo.

:: Ler escolha do usuário
set /p escolha="Digite a opção desejada: "

:: Executar a ação escolhida
if "%escolha%"=="1" (
    echo Limpando LogBag...
    takeown /f C:\Windows\System32\LogFiles\WMI\* /r /d y
    icacls C:\Windows\System32\LogFiles\WMI\* /grant administrators:F /t
    del /f /s /q C:\Windows\System32\LogFiles\WMI\*
)

if "%escolha%"=="2" (
    echo Limpando Logs do Sistema...
    takeown /f C:\Windows\System32\winevt\Logs\* /r /d y
    icacls C:\Windows\System32\winevt\Logs\* /grant administrators:F /t
    del /f /s /q C:\Windows\System32\winevt\Logs\*
)

if "%escolha%"=="3" (
    echo Limpando ShallBag...
    takeown /f C:\Windows\Temp\* /r /d y
    icacls C:\Windows\Temp\* /grant administrators:F /t
    del /f /s /q C:\Windows\Temp\*
)

if "%escolha%"=="4" (
    echo Limpando Prefetch...
    takeown /f C:\Windows\Prefetch\* /r /d y
    icacls C:\Windows\Prefetch\* /grant administrators:F /t
    del /f /s /q C:\Windows\Prefetch\*
)

if "%escolha%"=="5" (
    echo Limpando Journal...
    takeown /f C:\$Recycle.Bin\* /r /d y
    icacls C:\$Recycle.Bin\* /grant administrators:F /t
    del /f /s /q C:\$Recycle.Bin\*
)

if "%escolha%"=="6" (
    echo Limpando Histórico do Google Chrome...
    takeown /f "%LOCALAPPDATA%\Google\Chrome\User Data\Default\History" /r /d y
    icacls "%LOCALAPPDATA%\Google\Chrome\User Data\Default\History" /grant administrators:F /t
    del /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\History"
    del /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\History-journal"
)

if "%escolha%"=="7" (
    echo Limpando Histórico de Downloads do Google Chrome...
    takeown /f "%LOCALAPPDATA%\Google\Chrome\User Data\Default\DownloadMetadata" /r /d y
    icacls "%LOCALAPPDATA%\Google\Chrome\User Data\Default\DownloadMetadata" /grant administrators:F /t
    del /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\DownloadMetadata"
)

if "%escolha%"=="8" (
    echo Limpando tudo...

    :: Limpar LogBag
    takeown /f C:\Windows\System32\LogFiles\WMI\* /r /d y
    icacls C:\Windows\System32\LogFiles\WMI\* /grant administrators:F /t
    del /f /s /q C:\Windows\System32\LogFiles\WMI\*

    :: Limpar Logs do Sistema
    takeown /f C:\Windows\System32\winevt\Logs\* /r /d y
    icacls C:\Windows\System32\winevt\Logs\* /grant administrators:F /t
    del /f /s /q C:\Windows\System32\winevt\Logs\*

    :: Limpar ShallBag
    takeown /f C:\Windows\Temp\* /r /d y
    icacls C:\Windows\Temp\* /grant administrators:F /t
    del /f /s /q C:\Windows\Temp\*

    :: Limpar Prefetch
    takeown /f C:\Windows\Prefetch\* /r /d y
    icacls C:\Windows\Prefetch\* /grant administrators:F /t
    del /f /s /q C:\Windows\Prefetch\*

    :: Limpar Journal
    takeown /f C:\$Recycle.Bin\* /r /d y
    icacls C:\$Recycle.Bin\* /grant administrators:F /t
    del /f /s /q C:\$Recycle.Bin\*

    :: Limpar Histórico do Chrome
    takeown /f "%LOCALAPPDATA%\Google\Chrome\User Data\Default\History" /r /d y
    icacls "%LOCALAPPDATA%\Google\Chrome\User Data\Default\History" /grant administrators:F /t
    del /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\History"
    del /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\History-journal"

    :: Limpar Histórico de Downloads do Chrome
    takeown /f "%LOCALAPPDATA%\Google\Chrome\User Data\Default\DownloadMetadata" /r /d y
    icacls "%LOCALAPPDATA%\Google\Chrome\User Data\Default\DownloadMetadata" /grant administrators:F /t
    del /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\DownloadMetadata"

    :: Limpar Arquivos de Atualização do Windows
    takeown /f C:\Windows\SoftwareDistribution\Download\* /r /d y
    icacls C:\Windows\SoftwareDistribution\Download\* /grant administrators:F /t
    del /f /s /q C:\Windows\SoftwareDistribution\Download\*

    :: Limpar Lixeira
    del /f /s /q C:\$Recycle.Bin\*

    :: Limpar Cache do Sistema
    takeown /f C:\Windows\System32\catroot\* /r /d y
    icacls C:\Windows\System32\catroot\* /grant administrators:F /t
    del /f /s /q C:\Windows\System32\catroot\*

    echo Tudo limpo com sucesso!
)

if "%escolha%"=="9" (
    set /p caminho="Digite o caminho do arquivo a ser excluído: "
    if exist "%caminho%" (
        echo Excluindo %caminho%...
        del /f /q "%caminho%"
    ) else (
        echo Arquivo nao encontrado!
    )
)

if "%escolha%"=="10" (
    echo Limpando Arquivos de Atualização do Windows...
    takeown /f C:\Windows\SoftwareDistribution\Download\* /r /d y
    icacls C:\Windows\SoftwareDistribution\Download\* /grant administrators:F /t
    del /f /s /q C:\Windows\SoftwareDistribution\Download\*
)

if "%escolha%"=="11" (
    echo Limpando Lixeira...
    del /f /s /q C:\$Recycle.Bin\*
)

if "%escolha%"=="12" (
    echo Limpando Cache do Sistema...
    takeown /f C:\Windows\System32\catroot\* /r /d y
    icacls C:\Windows\System32\catroot\* /grant administrators:F /t
    del /f /s /q C:\Windows\System32\catroot\*
)

if "%escolha%"=="13" (
    echo Abrindo configurações de limpeza do Chrome...
    start chrome
    timeout /t 2 >nul
    powershell -command "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('^+{DEL}')"
)

if "%escolha%"=="14" (
    echo Limpando Histórico do Firefox...
    del /f /q "%APPDATA%\Mozilla\Firefox\Profiles\*\recovery.jsonlz4"
    del /f /q "%APPDATA%\Mozilla\Firefox\Profiles\*\places.sqlite"
    del /f /q "%APPDATA%\Mozilla\Firefox\Profiles\*\recovery.json"
    del /f /q "%APPDATA%\Mozilla\Firefox\Profiles\*\formhistory.sqlite"
    echo Histórico do Firefox limpo com sucesso!
)

if "%escolha%"=="15" (
    echo Reiniciando o explorer.exe...
    taskkill /f /im explorer.exe
    timeout /t 2 >nul
    start explorer.exe
    echo Explorer.exe reiniciado com sucesso!
)

if "%escolha%"=="0" (
    set /p confirmacao="Deseja sair e apagar este script? (s/n): "
    if /i "%confirmacao%"=="s" (
        echo [38;5;32mApagando rastros...[0m
        timeout /t 3 >nul
        echo del /f /q "%~f0" > "%temp%\deletar_script.bat"
        "%temp%\deletar_script.bat"
        exit
    ) else (
	echo [38;5;32mFechando Bypass.exe rxzk...[0m
        exit
    )
)

echo.
echo Operação concluída!
pause
goto menu
