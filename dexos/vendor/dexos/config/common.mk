# Global DexOS defaults focused on performance and low memory overhead
$(call inherit-product, vendor/dexos/config/packages.mk)
$(call inherit-product, vendor/dexos/config/gaming-props.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/dexos/overlay

PRODUCT_COPY_FILES += \
    system/etc/init/init.dexos.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.dexos.rc \
    system/bin/dexos_gamespace_service.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/dexos_gamespace_service.sh \
    bootanimation/desc.txt:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation/desc.txt

# Core vm tuning only; heavy eye-candy removed
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.dexos.bloat=0 \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m
