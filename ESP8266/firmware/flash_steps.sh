# From https://robertoostenveld.nl/esp8266-at-firmware/
# ESP8266-01 1MB
# Replace /dev/cu.usbserial-3420 with serial port

# Erase before loading something new...
esptool.py --port /dev/cu.usbserial-3420 erase_flash

# Step by Step
esptool.py --port /dev/cu.usbserial-3420 --baud 115200 write_flash --flash_mode dio 0x00000 boot_v1.2.bin
esptool.py --port /dev/cu.usbserial-3420 --baud 115200 write_flash --flash_mode dio 0x01000 at/512+512/user1.1024.new.2.bin
esptool.py --port /dev/cu.usbserial-3420 --baud 115200 write_flash --flash_mode dio 0x7C000 esp_init_data_default_v05.bin
esptool.py --port /dev/cu.usbserial-3420 --baud 115200 write_flash --flash_mode dio 0x7E000 blank.bin
