# DexOS product definition for Redmi Note 8 (ginkgo), Android 11
PRODUCT_NAME := dexos_ginkgo
PRODUCT_DEVICE := ginkgo
PRODUCT_BRAND := DexOS
PRODUCT_MODEL := Redmi Note 8
PRODUCT_MANUFACTURER := Xiaomi

# Inherit base Android 11 product and vendor trees
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/xiaomi/ginkgo/device.mk)
$(call inherit-product, vendor/xiaomi/ginkgo/ginkgo-vendor.mk)
$(call inherit-product, vendor/dexos/config/common.mk)

# Device-specific optimized overlays
PRODUCT_COPY_FILES += \
    device/xiaomi/ginkgo/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

# Enable shutter and Game Space
PRODUCT_PRODUCT_PROPERTIES += \
    persist.dexos.camera.quick_capture=true \
    persist.dexos.gamespace.enabled=true

# Memory + rendering balance for stable gameplay
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.lmk.medium=700 \
    ro.lmk.critical=900 \
    ro.lmk.use_minfree_levels=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    debug.sf.disable_backpressure=1 \
    persist.sys.sf.native_mode=1

# Keep per-device props in a dedicated file for maintainability
TARGET_SYSTEM_PROP += device/xiaomi/ginkgo/system.prop
