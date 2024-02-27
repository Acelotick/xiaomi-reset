@echo off
chcp 1251
chcp 65001
cls

echo -----
echo To proceed, install the necessary tools, fastboot, and drivers in your system.
echo Disclaimer: The author is not responsible for data loss during phone reset or failure.
echo Caution: Before performing a full reset, it is strongly recommended to create a backup of important files on your phone.
echo Also, consider creating a restore point on your Xiaomi smartphone!
echo Fastboot instructions: Turn off the device, then hold the power button and volume down button after turning it off.
echo Warning! Do not disconnect the cable from your smartphone, and use a functional cable to avoid failures.
echo The author takes no responsibility for your actions; you use this at your own risk!
echo -----
choice /c yn /m "Agree to the disclaimer: "

goto next

:exit

echo Exiting the application.
pause

exit

:next

if errorlevel 1 (
    goto next1
) else (
    goto exit
)

:next1
:fastboot

cls

echo The author takes no responsibility for your actions; you use this at your own risk!
echo Choosing the wipe level...
choice /c lhu /m "In this application, there are three parameters for wiping via Fastboot: Low-Erase High-Erase Ultra-Erase"
cd fastboot
if %errorlevel% equ 1 (
    cd low
    goto fastbooterase
) else if %errorlevel% equ 2 (
    cd high
    goto fastbooterase
) else (
    cd ultra
    goto fastbooterase
)

:fastbooterase
echo Start.. fastboot
call erase.bat
echo Device reset.
goto exit
