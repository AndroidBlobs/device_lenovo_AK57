# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from AK57 device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := lenovo
PRODUCT_DEVICE := AK57
PRODUCT_MANUFACTURER := lenovo
PRODUCT_NAME := lineage_AK57
PRODUCT_MODEL := L10041

PRODUCT_GMS_CLIENTID_BASE := android-lenovo
TARGET_VENDOR := lenovo
TARGET_VENDOR_PRODUCT_NAME := AK57
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="AK57-user 10 QP1A.190711.020 11.0.022_200518 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Lenovo/AK57/AK57:10/QP1A.190711.020/11.0.022_200518:user/release-keys
