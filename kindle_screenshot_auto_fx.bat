@echo off
setlocal enabledelayedexpansion

set max=2
for /L %%i in (1,1,%max%) do (
    set num=00000%%i
    set output_path=/sdcard/!num:~-4!.png
	rem echo %max%中%%i枚目を処理しています。
	echo [%%i/%max%] %%i枚目を処理しています。
    adb shell screencap -p !output_path!
    adb shell input touchscreen swipe 500 500 1000 500
    adb pull !output_path!
    adb shell rm !output_path!
    timeout /t 1
)
echo すべての処理が終了しました。