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

# DexOS essentials only (lean build)
PRODUCT_PACKAGES += \
    DexOSGameSpace \
    Launcher3QuickStep \
    SimpleCamera \
    GmsCore \
    GoogleServicesFramework \
    Phonesky

# Enable shutter and quick capture helper
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dexos.camera.quick_capture=true \
    persist.dexos.gamespace.enabled=true \
    ro.config.low_ram=false \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3

# Keep system lightweight
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.lmk.medium=700 \
    ro.lmk.critical=900 \
    ro.lmk.use_minfree_levels=true \
    debug.sf.disable_backpressure=1 \
    persist.sys.sf.native_mode=1
