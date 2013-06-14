# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#
# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

USE_CAMERA_STUB := true

# inherit from common msm8660
-include device/pantech/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/pantech/ef40s/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := ef40s

# assert
TARGET_OTA_ASSERT_DEVICE := a810s,ef40s,IM-A810S

# kernel
BOARD_KERNEL_CMDLINE        := console=ttyHSL0,115200,n8 androidboot.hardware=qcom loglevel=0
BOARD_KERNEL_BASE           := 0x40200000
BOARD_MKBOOTIMG_ARGS        := --ramdisk_offset 0x01300000
BOARD_KERNEL_PAGESIZE       := 2048

TARGET_KERNEL_CONFIG := msm8660-perf-EF40S_TP20_defconfig
TARGET_KERNEL_SOURCE := ../kernel/ef40s-4.2
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
# Define Prebuilt kernel locations
#TARGET_PREBUILT_KERNEL := device/pantech/ef40s/prebuilt/kernel

# Suppress the WIPE command since it can brick our EMMC
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_VOLD_MAX_PARTITIONS := 27
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file


#Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/pantech/ef40s/bluetooth/include
BOARD_BLUEDROID_VENDOR_CONF := device/pantech/ef40s/bluetooth/vnd_msm8660.txt


# recovery
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 629145600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE             := 131072

BOARD_HAS_NO_SELECT_BUTTON     := true
BOARD_HAS_NO_MISC_PARTITION    := true
BOARD_USES_MMCUTILS            := true
BOARD_HAS_LARGE_FILESYSTEM     := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

BOARD_SDCARD_DEVICE_PRIMARY   := /dev/block/mmcblk0p27
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1p1
