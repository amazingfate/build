# Allwinner A733 octa-core 2-16GB LPDDR5 WiFi6/BT GBE USB3 NVMe soldered eMMC
BOARD_NAME="ArmSoM Sige6"
BOARD_VENDOR="armsom"
BOARDFAMILY="sun60iw2"
BOARD_MAINTAINER=""
INTRODUCED="2026"
KERNEL_TARGET="vendor"
KERNEL_TEST_TARGET="vendor"
IMAGE_PARTITION_TABLE="msdos"
HAS_VIDEO_OUTPUT="no" # no desktop on this vendor kernel; board-level so the build-list inventory sees it

BOOT_FDT_FILE="allwinner/sun60i-a733-armsom-sige6.dtb"

# AIC8800D80 combo: BT is UART HCI on ttyS1 and needs userspace bring-up
SUN60IW2_UART_BT="yes"

# Per-board boot blobs for uboot_custom_postprocess (LPDDR5 — do not reuse OPi blobs).
# Generated from ArmSoM BSP a733/bin + sys_config.
SUNXI_BOOT0_SDCARD_FEX="${SRC}/packages/blobs/sunxi/sun60iw2/boot0_sdcard_armsom-sige6.fex"
SUNXI_BOOT0_SPINOR_FEX="${SRC}/packages/blobs/sunxi/sun60iw2/boot0_spinor_armsom-sige6.fex"
SUNXI_SYS_CONFIG_FEX="${SRC}/packages/blobs/sunxi/sun60iw2/sys_config_armsom-sige6.fex"

# Invalidate U-Boot cache if any of the blobs change
UBOOT_HASH_EXTRA="$(cat "${SUNXI_BOOT0_SDCARD_FEX}" "${SUNXI_BOOT0_SPINOR_FEX}" "${SUNXI_SYS_CONFIG_FEX}" | sha256sum | cut -d' ' -f1)"
