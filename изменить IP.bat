@echo off
cls
setlocal EnableDelayedExpansion

:: Dados do usuário e senha
set "usr=rxzk.xit"
set "pwd=By1221pass"
set /a att=0

:: Definir parâmetros SMTP
set "smtp_server=smtp.gmail.com"
set "smtp_port=587"
set "smtp_user=seu_email@gmail.com"
set "smtp_pass=sua_senha_email"

:lg
cls
echo [38;5;225m[ LOGIN ][0m
set /p "uI=Usuario: "
set /p "pI=Senha: "

:: Comparar as credenciais
if "%uI%"=="%usr%" if "%pI%"=="%pwd%" (
    echo [38;5;225mAcesso Permitido![0m
    timeout /t 1 >nul
    goto otp
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

:otp
cls
set /a "otp_code=%random% %% 9000 + 1000"
echo Seu código de autenticação: %otp_code%
echo Insira seu e-mail para receber o código OTP.
set /p "email_input=E-mail: "

:: Enviar e-mail com o código OTP
call :enviar_email %email_input% %otp_code%

goto mn

:enviar_email
:: Enviar e-mail com PowerShell
powershell -Command ^
    $smtpServer = "%smtp_server%"; ^
    $smtpPort = %smtp_port%; ^
    $smtpUser = "%smtp_user%"; ^
    $smtpPass = ConvertTo-SecureString "%smtp_pass%" -AsPlainText -Force; ^
    $from = "%smtp_user%"; ^
    $to = "%1"; ^
    $subject = "Verificação OTP"; ^
    $body = "Seu código de autenticação é: %2"; ^
    $smtp = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort); ^
    $smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPass); ^
    $smtp.EnableSsl = $true; ^
    $message = New-Object System.Net.Mail.MailMessage($from, $to, $subject, $body); ^
    $smtp.Send($message)
goto :eof

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
