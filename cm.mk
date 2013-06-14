# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Release name
PRODUCT_RELEASE_NAME := ef40s

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/pantech/ef40s/device.mk)

# Device naming
PRODUCT_DEVICE := ef40s
PRODUCT_NAME := cm_ef40s
PRODUCT_BRAND := SKY
PRODUCT_MODEL := IM-A810S
PRODUCT_MANUFACTURER := PANTECH
PRODUCT_DEFAULT_LANGUAGE := zh
PRODUCT_DEFAULT_REGION := CN

# Boot animation
#TARGET_SCREEN_HEIGHT := 1280
#TARGET_SCREEN_WIDTH := 800
TARGET_BOOTANIMATION_NAME := 800

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=IM-A810S \
    TARGET_DEVICE=IM-A810S \
    BUILD_FINGERPRINT=PANTECH/IM-A810S/IM-A810S:4.2.2/JDQ39E/217A:user/release-keys \
    PRIVATE_BUILD_DESC="IM-A810S-user 4.2.2 JDQ39E release-keys"
    
    
PRODUCT_LOCALES := zh_CN zh_TW en_US

# Set CM_BUILDTYPE
CM_NIGHTLY := true

