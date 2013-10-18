@echo off
setlocal EnableDelayedExpansion
set "file=%~1"

for /f "delims=" %%n in ('find /c /v "" %file%') do set "len=%%n"
set "len=!len:*: =!"

<%file% (
  for /l %%l in (1 1 !len!) do (
    set "line="
    set /p "line="
    echo !line!
    netsh.exe advfirewall firewall add rule name="diablo3 block ip !line!" dir=out protocol=any action=block remoteip=!line!
  )
)
