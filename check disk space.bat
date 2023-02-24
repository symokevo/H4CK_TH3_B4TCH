@echo off
set "drive_letter=C:"
set "threshold=10"
set "email_address=codesimonwise@gmail.com"
set "email_subject=Low disk space alert"
set "email_body=Free disk space on %drive_letter% is below %threshold%."

for /f "tokens=2" %%a in ('wmic logicaldisk where "DeviceID='%drive_letter%'" get FreeSpace^,Size /format:value') do set "free_space=%%a"

set /a "free_space_gb=free_space / 1024 / 1024 / 1024"
if %free_space_gb% leq %threshold% (
    echo Sending email alert...
    powershell -command "Send-MailMessage -To '%email_address%' -Subject '%email_subject%' -Body '%email_body%' -SmtpServer 'smtp.example.com'"
) else (
    echo Free disk space on %drive_letter% is %free_space_gb%GB.
)
