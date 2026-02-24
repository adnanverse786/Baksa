# DexOS (Android 11) for Redmi Note 8 (ginkgo) — Minimal Gaming ROM Blueprint

This repository provides a compact, build-ready skeleton for a custom ROM called **DexOS** designed to be lightweight and gaming-focused.

## Goals
- Android 11 base
- Minimal UI and bloat
- Efficient RAM and LMK tuning
- Core GApps only
- Quick shutter capture support
- Direct Game Space launcher app
- Simple custom boot animation

## Critical files/components to include in a complete ROM

### Boot chain and recovery
1. `boot.img` — kernel + ramdisk for normal boot.
2. `vendor_boot.img` (if board config requires split boot on your tree).
3. `dtbo.img` — device tree blob overlays.
4. `vbmeta.img` / `vbmeta_system.img` / `vbmeta_vendor.img` — AVB metadata.
5. `recovery.img` — recovery environment (or recovery-in-boot on A/B layouts).
6. `abl`, `xbl`, `xbl_config`, `tz`, `hyp`, `modem`, `dsp` firmware images (from matching MIUI base).

### Main Android partitions
7. `system.img` — framework, system apps, init overlays.
8. `system_ext.img` — OEM extensions and privileged add-ons.
9. `product.img` — product apps/configs (including bootanimation placement if desired).
10. `vendor.img` — HALs, proprietary libs, sepolicy bits.
11. `odm.img` (if used by your device tree/vendor setup).

### Runtime and metadata
12. `userdata` fstab/encryption config (`fstab.qcom`, init/fde/fbe props).
13. SELinux policies (`system/sepolicy`, `vendor_sepolicy.cil` integration).
14. Kernel config/defconfig (`arch/arm64/configs/*ginkgo*_defconfig`).
15. OTA metadata (`META-INF/com/android/metadata`, payload properties).

## Files in this DexOS skeleton
- `dexos/device/xiaomi/ginkgo/dexos_ginkgo.mk`: Product definition with minimal package set and gaming properties.
- `dexos/vendor/dexos/config/common.mk`: Shared DexOS defaults, RAM tuning, copy rules.
- `dexos/system/etc/init/init.dexos.rc`: Init actions for governor hints, quick shutter, gamespace daemon.
- `dexos/system/bin/dexos_gamespace_service.sh`: Service script to register a Game Space shortcut.
- `dexos/packages/apps/DexOSGameSpace/*`: Lightweight game hub app.
- `dexos/bootanimation/desc.txt`: Simple boot animation playback descriptor.

## Integration notes
- Add `dexos_ginkgo.mk` to your lunch combos (`AndroidProducts.mk`).
- Ensure proprietary blobs and kernel source match Redmi Note 8 Android 11 vendor base.
- Verify SELinux labels for added service/script files.
- Use only core GApps (`GmsCore`, `GoogleServicesFramework`, `Phonesky`) to stay lean.
