#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8660 configs
$(call inherit-product, device/pantech/msm8660-common/msm8660.mk)

DEVICE_PACKAGE_OVERLAYS += device/pantech/ef40s/overlay


# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/pantech/ef40s/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/pantech/ef40s/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/pantech/ef40s/ramdisk/init.target.rc:root/init.target.rc \
    device/pantech/ef40s/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/pantech/ef40s/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/pantech/ef40s/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/pantech/ef40s/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/pantech/ef40s/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    device/pantech/ef40s/ramdisk/init.qcom.coex.sh:root/init.qcom.coex.sh \
    device/pantech/ef40s/ramdisk/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    device/pantech/ef40s/ramdisk/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    device/pantech/ef40s/ramdisk/init.qcom.baseband.sh:root/init.qcom.baseband.sh \
    device/pantech/ef40s/ramdisk/fstab.qcom:root/fstab.qcom

# vold config
PRODUCT_COPY_FILES += \
    device/pantech/ef40s/configs/vold.fstab:system/etc/vold.fstab
    
# Input device config
PRODUCT_COPY_FILES += \
    device/pantech/ef40s/idc/qt602240_ts_input.idc:system/usr/idc/qt602240_ts_input.idc

# app
PRODUCT_PACKAGES += \
    Torch
    
# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=240 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so \

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# call the proprietary setup
$(call inherit-product-if-exists, vendor/pantech/ef40s/ef40s-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
