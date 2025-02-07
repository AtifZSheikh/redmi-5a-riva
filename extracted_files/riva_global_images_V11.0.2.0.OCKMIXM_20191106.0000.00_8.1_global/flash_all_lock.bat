echo "riva Fastboot Tool Ver 3.0"

fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *riva" || echo Missmatching image and device
fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *riva" || exit /B 1

fastboot %* flash partition "%~dp0images\gpt_both0.bin" || @echo "Flash partition error" && exit /B 1

fastboot %* flash crclist "%~dp0images\crclist.txt" || @echo "Flash crclist error" && exit /B 1
fastboot %* flash sparsecrclist "%~dp0images\sparsecrclist.txt" || @echo "Flash sparsecrclist error" && exit /B 1

fastboot %* flash tz "%~dp0images\tz.mbn" || @echo "Flash tz error" && exit /B 1
fastboot %* flash sbl1 "%~dp0images\sbl1.mbn" || @echo "Flash sbl1 error" && exit /B 1
fastboot %* flash rpm "%~dp0images\rpm.mbn" || @echo "Flash rpm error" && exit /B 1
fastboot %* flash aboot "%~dp0images\emmc_appsboot.mbn" || @echo "Flash emmc_appsboot error" && exit /B 1

fastboot %* flash tzbak "%~dp0images\tz.mbn" || @echo "Flash tzbak error" && exit /B 1
fastboot %* flash sbl1bak "%~dp0images\sbl1.mbn" || @echo "Flash sbl1bak error" && exit /B 1
fastboot %* flash rpmbak "%~dp0images\rpm.mbn" || @echo "Flash uboot rpmbak" && exit /B 1
fastboot %* flash abootbak "%~dp0images\emmc_appsboot.mbn" || @echo "Flash abootbak error" && exit /B 1

fastboot %* flash devcfg "%~dp0images\devcfg.mbn" || @echo "Flash devcfg error" && exit /B 1
fastboot %* flash lksecapp "%~dp0images\lksecapp.mbn" || @echo "Flash lksecapp error" && exit /B 1
fastboot %* flash cmnlib "%~dp0images\cmnlib_30.mbn" || @echo "Flash cmnlib error" && exit /B 1
fastboot %* flash keymaster "%~dp0images\keymaster.mbn" || @echo "Flash keymaster error" && exit /B 1

fastboot %* flash devcfgbak "%~dp0images\devcfg.mbn" || @echo "Flash devcfgbak error" && exit /B 1
fastboot %* flash lksecappbak "%~dp0images\lksecapp.mbn" || @echo "Flash lksecappbak error" && exit /B 1
fastboot %* flash cmnlibbak "%~dp0images\cmnlib_30.mbn" || @echo "Flash cmnlibbak error" && exit /B 1
fastboot %* flash keymasterbak "%~dp0images\keymaster.mbn" || @echo "Flash keymasterbak error" && exit /B 1

fastboot %* flash dsp "%~dp0images\adspso.bin" || @echo "Flash dsp error" && exit /B 1

fastboot %* erase boot
fastboot %* erase mdtp

fastboot %* flash modem "%~dp0images\NON-HLOS.bin" || @echo "Flash modem error" && exit /B 1
fastboot %* flash system "%~dp0images\system.img" || @echo "Flash system error" && exit /B 1
fastboot %* flash cache "%~dp0images\cache.img" || @echo "Flash cache error" && exit /B 1
fastboot %* flash userdata "%~dp0images\userdata.img" || @echo "Flash userdata error" && exit /B 1
fastboot %* flash recovery "%~dp0images\recovery.img" || @echo "Flash recovery error" && exit /B 1
fastboot %* flash boot "%~dp0images\boot.img" || @echo "Flash boot error" && exit /B 1
::fastboot %* flash mdtp "%~dp0images\mdtp.img" || @echo "Flash mdtp error" && exit /B 1

fastboot %* flash splash "%~dp0images\splash.img" || @echo "Flash splash error" && exit /B 1
fastboot %* flash cust "%~dp0images\cust.img" || @echo "Flash cust error" && exit /B 1

fastboot %* oem lock
fastboot %* reboot

pause
