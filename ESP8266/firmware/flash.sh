# ESP8266-01 1MB

# Most recent working version of AT firmware:
# AT version:1.6.2.0(Apr 13 2018 11:10:59)
# SDK version:2.2.1(6ab97e9)
# compile time:Jun  7 2018 19:34:26
# Bin version(Wroom 02):1.6.2


# Replace /dev/cu.usbserial-4420 with current serial port or pass as CLI arg.
SERIAL_PORT=${1:-/dev/cu.usbserial-4420}

# 115200 is much slower (well 4 times slower) but more fault tolerant
# if TX/RX aren't ideally connected. It's worth trying faster first...
BAUD=460800

# 1.2 and later all work
BOOT_VER=boot_v1.7.bin

# Only one that work 1MB
AT_BIN=at/512+512/user1.1024.new.2.bin

# ESP Init Data. v05 and v08 work.
INIT_DATA_BIN=esp_init_data_default_v08.bin

# Erase before loading something new
esptool.py --port $SERIAL_PORT erase_flash

# Step by Step
esptool.py --port $SERIAL_PORT --baud $BAUD \
  write_flash --flash_mode dio \
  0x00000 $BOOT_VER \
  0x01000 $AT_BIN \
  0x7C000 $INIT_DATA_BIN \
  0x7E000 blank.bin
