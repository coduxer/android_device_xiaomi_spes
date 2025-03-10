#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from spes/spesn device
$(call inherit-product, device/xiaomi/spes/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Additions
$(call inherit-product-if-exists, vendor/prebuilt-apps/config.mk)

#Default when no special release_type is set
ifneq ($(filter-out _VANILLA _GAPPS _MICROG,_$(RELEASE_TYPE)),)
    #Gapps
    $(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)

    #MicroG
    $(call inherit-product-if-exists, vendor/partner_gms/products/gms.mk)
endif
#Special case when release_type set to GAPPS
ifeq ($(RELEASE_TYPE), GAPPS)
    #Gapps
    $(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
endif
#Special case when release type set to MICROG
ifeq ($(RELEASE_TYPE), MICROG)
    #Microg
    $(call inherit-product, vendor/microg/products/gms.mk)
endif
#Special case when release type set to VANILLA
ifeq ($(RELEASE_TYPE), VANILLA)
    # Do nothing
endif

# Camera
$(call inherit-product-if-exists, vendor/miuicamera/config.mk)

# Product Specifics
PRODUCT_NAME := lineage_spes
PRODUCT_DEVICE := spes
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 11
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

# Fingerprint
BUILD_FINGERPRINT := "Redmi/spes/spes:12/SKQ1.211103.001/V13.0.6.0.SGKMIXM:user/release-keys"

# F-Droid Privileged Extension
PRODUCT_PACKAGES += \
    F-DroidPrivilegedExtension
