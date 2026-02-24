# DexOS (Android 11) for Redmi Note 8 (ginkgo) — Optimized Minimal ROM Blueprint

DexOS is designed to stay lean while improving gaming consistency (frame pacing, touch latency, memory pressure behavior).

## What was improved in this revision
- Split config into reusable layers (`packages.mk` + `gaming-props.mk`) to avoid monolithic tuning and make per-device optimization easier.
- Added explicit lunch targets (`AndroidProducts.mk`) and board optimization toggles (`BoardConfigDexOS.mk`).
- Added device-level `system.prop`, `fstab.qcom`, and SELinux policy stubs for clean bring-up.
- Reworked Game Space app into resource-based layout for maintainability.
- Added a boot animation frame generator script for simple branded animation.

## Critical partition/images required for Redmi Note 8 ROM delivery

### Boot + verified boot + firmware
1. `boot.img`
2. `vendor_boot.img` (if split-boot setup is enabled)
3. `dtbo.img`
4. `vbmeta.img`
5. `vbmeta_system.img`
6. `vbmeta_vendor.img`
7. `recovery.img`
8. Firmware chain from matching MIUI base (`abl`, `xbl`, `xbl_config`, `tz`, `hyp`, `modem`, `dsp`)

### Android dynamic partitions
9. `system.img`
10. `system_ext.img`
11. `product.img`
12. `vendor.img`
13. `odm.img`
14. `super.img` metadata consistency (group + logical partition map)

### Runtime security + OTA metadata
15. `fstab.qcom` and encryption flags (FBE/ICE)
16. SELinux policies (platform + vendor policy merge)
17. Kernel defconfig and modules list
18. OTA metadata (`payload.bin`, `care_map.pb`, `metadata`)

## DexOS file map (important)

### Product / Board
- `dexos/device/xiaomi/ginkgo/AndroidProducts.mk` — lunch combos.
- `dexos/device/xiaomi/ginkgo/dexos_ginkgo.mk` — device product and tuning properties.
- `dexos/device/xiaomi/ginkgo/BoardConfigDexOS.mk` — dynamic partition + dexpreopt + AVB flags.
- `dexos/device/xiaomi/ginkgo/system.prop` — performance/system properties.
- `dexos/device/xiaomi/ginkgo/rootdir/etc/fstab.qcom` — mount and encryption baseline.

### Security policy
- `dexos/device/xiaomi/ginkgo/sepolicy/private/dexos_gamespaced.te`
- `dexos/device/xiaomi/ginkgo/sepolicy/private/file_contexts`

### Vendor config
- `dexos/vendor/dexos/config/common.mk`
- `dexos/vendor/dexos/config/packages.mk`
- `dexos/vendor/dexos/config/gaming-props.mk`

### Runtime features
- `dexos/system/etc/init/init.dexos.rc` — quick capture + Game Space service + VM hints.
- `dexos/system/bin/dexos_gamespace_service.sh` — direct shortcut registration for Game Space.

### App + UX
- `dexos/packages/apps/DexOSGameSpace/*` — minimal game hub app.
- `dexos/bootanimation/desc.txt` — animation timing.
- `dexos/tools/generate_bootanimation_frames.py` — generate simple DexOS animation frames.

## Integration steps (minimal)
1. Hook `AndroidProducts.mk` into your `device/xiaomi/ginkgo` tree.
2. Include `vendor/dexos/config/common.mk` from your product makefile.
3. Merge SELinux policy and verify labels for custom service script.
4. Generate boot animation frames and package into `bootanimation.zip` for `product/media`.
5. Keep only core GApps (`GmsCore`, `GoogleServicesFramework`, `Phonesky`) for low overhead.
