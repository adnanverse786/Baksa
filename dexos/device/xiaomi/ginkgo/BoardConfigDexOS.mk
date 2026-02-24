# DexOS board-level additions for Redmi Note 8 (ginkgo)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_VARIANT := kryo300

# Dynamic partitions (Android 11)
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm

# Build-time optimizations
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# ZRAM and low-memory tuning defaults
BOARD_USES_ZRAM := true
BOARD_ZRAM_SIZE_MB := 2048

# AVB chain placeholders
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_VENDOR := vendor odm
