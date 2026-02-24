# Global DexOS defaults focused on performance and low memory overhead
PRODUCT_PACKAGE_OVERLAYS += vendor/dexos/overlay

PRODUCT_COPY_FILES += \
    system/etc/init/init.dexos.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.dexos.rc \
    bootanimation/desc.txt:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation/desc.txt \
    system/bin/dexos_gamespace_service.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/dexos_gamespace_service.sh

# Performance/gaming defaults
PRODUCT_PROPERTY_OVERRIDES += \
    ro.dexos.mode=gaming \
    ro.dexos.bloat=0 \
    ro.dexos.ram_optimization=1 \
    persist.sys.dalvik.vm.lib.2=libart.so \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m \
    persist.sys.disable_rescue=true
