@echo off
set /p text=Enter text to convert to speech: 

echo Creating speech file...

echo Set speech = Wscript.CreateObject("SAPI.SpVoice") > speech.vbs
echo speech.Speak "%text%" >> speech.vbs
cscript.exe speech.vbs

echo Speech file created.

pause