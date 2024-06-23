:start
cls
@echo off
setlocal EnableDelayedExpansion
set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()+=-_|\}]{[~`"
set "RAND="
for /l %%i in (1,1,20) do (
    set /a "randIndex=!RANDOM! %% 62"
    for %%j in (!randIndex!) do (
        set "char=!chars:~%%j,1!"
        set "RAND=!RAND!!char!"
    )
)
echo %RAND% > bot.txt
git add .
git commit -m "%RAND%"
git push origin
git init
git add code.txt
git commit -m "New commit"
git branch -M main
git remote add origin https://github.com/SelimWaly/commits-playground-bat.git
git push -u origin main
goto :start
endlocal
