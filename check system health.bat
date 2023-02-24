@echo off
echo System Health Monitor

:loop
set timestamp=%date% %time%
set cpu=
for /f "skip=1" %%p in ('wmic cpu get loadpercentage') do (
    if not defined cpu set cpu=%%p
)
set mem=
for /f "skip=1" %%m in ('wmic os get freephysicalmemory') do (
    if not defined mem set mem=%%m
)
set disk=
for /f "skip=1" %%d in ('wmic logicaldisk get size,freespace^|find "C:"') do (
    set disk=%%d
)
echo %timestamp% CPU usage: %cpu%%%
echo %timestamp% Available memory: %mem% KB
echo %timestamp% Available disk space: %disk%
ping localhost -n 2 >nul
goto loop