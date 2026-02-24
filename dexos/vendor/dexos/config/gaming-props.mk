# DexOS gaming and memory tuning properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.dexos.mode=gaming \
    ro.dexos.ram_optimization=1 \
    ro.dexos.target_fps=90 \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.thrashing_limit=40 \
    ro.lmk.thrashing_limit_decay=10 \
    ro.lmk.swap_util_max=65 \
    persist.device_config.runtime_native_boot.profilebootclasspath=true \
    persist.sys.dexopt.bg-dexopt=verify \
    persist.sys.purgeable_assets=1 \
    persist.sys.trim_on_background=true
