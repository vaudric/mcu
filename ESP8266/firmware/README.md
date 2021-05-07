ESP8266 Firmware notes

# AT Commands Firmware for ESP8266
- Exec flash.sh (with a few tweaks) in the bin directory of the ESP SDK.
- Or flash one of the bins in this directory. 1MB f/w only here.


# AT Commands Resources:

## Espressif
- AT: https://www.espressif.com/en/support/download/at
- SDK: https://www.espressif.com/en/support/download/sdks-demos

## ESP8266 ESP-01 1MB learning pain...
 - It seemed to be very straight forward with 2MB or more onboard the module but working with the 1MB appeared to be a challenge.
 - Most articles explaining to flash the firmware present more or less the same approach in different flavors but always with a PC running windows to flash the AT commands firmware but that doesn't help closing the loop for Linux/Mac users.
 - Finally the one article that led to the working firmware: https://robertoostenveld.nl/esp8266-at-firmware/. Thanks a lot Robert!
 - Most recent version that works AT+1.6.2 (Apr 13 2018 11:10:59) in ESP8266_NONOS_SDK-2.2.1: https://github.com/espressif/ESP8266_NONOS_SDK/releases/tag/v2.2.1

## Good pointers
- https://www.instructables.com/Flash-or-Upgrade-Firmware-on-ESP8266-ESP-01-Module/. Key info: 1.7.1+ impossible with 1MB module.
- https://www.instructables.com/Intro-Esp-8266-firmware-update/
- https://kychem.wordpress.com/2017/12/05/flashing-the-esp8266-version-1-with-at-firmware/
- https://www.allaboutcircuits.com/projects/flashing-the-ESP-01-firmware-to-SDK-v2.0.0-is-easier-now/

# ESPTOOLS for Linux/Mac

## Info
$> esptool.py -p <serial_port> flash_id

## Save existing firmware
$> esptool.py -p <serial_port> read_flash 0x0 <flash_size> <firmware.bin>

flash_size:
1MB: 0x100000
4MB: 0x400000
8MB: 0x800000

## Erase flash
$> esptool.py -p <serial_port> erase_flash

## Load firmware (micropython, backup made with read_flash, ...)
$> esptool.py -p <serial_port> --baud 460800 write_flash --flash_size=detect 0 <firmware.bin>
