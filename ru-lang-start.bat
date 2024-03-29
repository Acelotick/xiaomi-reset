@echo off
chcp 1251
chcp 65001
cls

echo -----
echo Для работы установите в систему нужные инструменты fastboot и драйвера
echo Отказ от ответственности: Автор не несет ответственности за потерю данных при сбросе телефона или сбое.
echo Внимание: Прежде чем выполнять полный сброс, настоятельно рекомендуется создать резервную копию важных файлов на вашем телефоне.
echo Также рассмотрите возможность создания точки восстановления на вашем смартфоне Xiaomi!
echo Инструкции по Fastboot: Выключите устройство, затем удерживайте кнопку включения и кнопку уменьшения громкости после выключения.
echo Предупреждение! Не отключайте кабель от вашего смартфона и используйте исправный кабель, чтобы избежать сбоев.
echo Автор не несет ответственности за ваши действия; вы используете это на свой страх и риск!
echo -----
choice /c yn /m "Согласны с отказом от ответственности: "

goto next

:exit

echo Выход из приложения.
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

echo Автор не несет ответственности за ваши действия; вы используете это на свой страх и риск!
echo Выбор уровня очистки...
choice /c lhu /m "В этом приложении есть три параметра для очистки через Fastboot: Low-Erase High-Erase Ultra-Erase"
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
echo Старт.. fastboot
call erase.bat
echo Устройство сброшено.
goto exit
