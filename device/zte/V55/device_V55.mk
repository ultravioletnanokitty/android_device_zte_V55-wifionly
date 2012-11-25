
$(call inherit-product, device/common/gps/gps_us_supl.mk)
#$(call inherit-product, device/zte/V11A/libcamera/Android.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/zte/V55/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
$(LOCAL_KERNEL):kernel \

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_V55
PRODUCT_DEVICE := V55
PRODUCT_MANUFACTURER := ZTE
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Optik
PRODUCT_BOARD := V55
PRODUCT_CHARACTERISTICS :=tablet,nosdcard
DEVICE_PACKAGE_OVERLAYS := device/zte/V55/overlay
PRODUCT_TAGS += dalvik.gc.type-precise
#shell_ash
PRODUCT_PROPERTY_OVERRIDES+= dalvik.vm.execution-mode=int:jit \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=5000 \
	dalvik.vm.dexopt-flags=m=y \
	debug.enabletr=true \
	persist.sys.use_dithering=0 \
	ro.com.google.locationfeatures=1 \
	mobiledata.interfaces = eth0

# Provides overrides to configure the Dalvik heap for a standard tablet device.

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=256m

#### Goo Manager support
## Note from uvnk: this is cool, I'm not a recognised developer though, so I can't use it.

#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.goo.developerid=joestone \
#    ro.goo.board=$(subst full_,,$(PRODUCT_DEVICE)) \
#	ro.goo.rom=CM10_SprintOptik \
#	ro.goo.version=$(shell date +%Y%m%d )

	
PRODUCT_LOCALES += hdpi
PRODUCT_LOCALES += xhdpi
#PRODUCT_LOCALES += nodpi

PRODUCT_AAPT_CONFIG := hdpi xhdpi 

#LLVM for RenderScript
#$(call inherit-product, external/llvm/llvm-select.mk)
LLVM_ROOT_PATH := external/llvm

#PRODUCT_PACKAGES += audio.primary.msm8660
#PRODUCT_PACKAGES += audio_policy.msm8660
#PRODUCT_PACKAGES += audio_policy.conf
PRODUCT_PACKAGES += copybit.msm8660
PRODUCT_PACKAGES += gralloc.msm8660
PRODUCT_PACKAGES += lights.msm8660
PRODUCT_PACKAGES += hwcomposer.msm8660
PRODUCT_PACKAGES += libmemalloc
PRODUCT_PACKAGES += libstagefrighthw
PRODUCT_PACKAGES += libaudioutils
PRODUCT_PACKAGES += gps.default

#MM_CORE
PRODUCT_PACKAGES += libmm-omxcore
PRODUCT_PACKAGES += libOmxCore
PRODUCT_PACKAGES += libOmxAacEnc
PRODUCT_PACKAGES += libOmxAmrEnc
PRODUCT_PACKAGES += libOmxEvrcEnc
PRODUCT_PACKAGES += libOmxQcelp13Enc

#MM_VIDEO
PRODUCT_PACKAGES += ast-mm-vdec-omx-test
PRODUCT_PACKAGES += libdivxdrmdecrypt
PRODUCT_PACKAGES += liblasic
PRODUCT_PACKAGES += libOmxVdec
PRODUCT_PACKAGES += libOmxVenc
PRODUCT_PACKAGES += libOpenMAXAL
PRODUCT_PACKAGES += libOpenSLES
PRODUCT_PACKAGES += libOmxVidEnc
PRODUCT_PACKAGES += mm-vdec-omx-property-mgr
PRODUCT_PACKAGES += mm-vdec-omx-test
PRODUCT_PACKAGES += mm-venc-omx-test
PRODUCT_PACKAGES += mm-venc-omx-test720p
PRODUCT_PACKAGES += mm-video-driver-test
PRODUCT_PACKAGES += mm-video-encdrv-test
PRODUCT_PACKAGES += libmmjpeg_interface 
PRODUCT_PACKAGES += libcamera
#ash shell
PRODUCT_PACKAGES += liblinenoise

# Sensors
PRODUCT_PACKAGES += libinvensense_hal


PRODUCT_PACKAGES += \
    AccountAndSyncSettings \
    DeskClock \
    AlarmProvider \
    Bluetooth \
	busybox \
	applypatch \
    Calculator \
    LegacyCamera \
    Calendar \
    CertInstaller \
    DrmProvider \
    Email \
    Gallery2 \
    LatinIME \
    Launcher2 \
    Mms \
    Music \
	MusicFX \
    Protips \
    QuickSearchBox \
	hcitool \
	brcm_patchram_plus \
    Settings \
    Sync \
    SystemUI \
    Updater \
    CalendarProvider \
    SyncProvider \
    IM \
    hciconfig \
	hciattach \
	CMParts \
    CMScreenshot \
    CMStats \
	libwpa_client \
	hostapd \
	hostapd_cli \
	Superuser \
	hdmid \
	libinvensense_hal \
	libmllite \
	libmlplatform \
	camera.msm8660 \
	audio.a2dp.default \
	audio.usb.default \
    VideoEditor \
	libI420colorconvert \
#	Phone \
#	Provision \
#	VoiceDialer \
#	rild \
#	libril \
#	libreference-ril \

# Live Wallpapers
PRODUCT_PACKAGES += \
        librs_jni \
		CMWallpapers \
        LiveWallpapers \
        VisualizationWallpapers \
        LiveWallpapersPicker \

#Theme package
PRODUCT_PACKAGES += \
	ThemeManager \
	ThemeChooser \
	com.tmobile.themes \
	Androidian \
	Cyanbread
		
# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
	com.android.future.usb.accessory \
    setup_fs

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	device/zte/V55/proprietary/etc/permissions/com.invensense.android.hardware.xml:/system/etc/permissions/com.invensense.android.hardware.xml \
#	device/zte/V55/proprietary/etc/permissions/com.google.android.media.effects.xml:/system/etc/permissions/com.google.android.media.effects.xml \
#	device/zte/V55/proprietary/etc/permissions/com.google.android.maps.xml:/system/etc/permissions/com.google.android.maps.xml \
#	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
#	frameworks/native/data/etc/com.tmobile.software.themes.xml:/system/etc/permissions/com.tmobile.software.themes.xml \
#	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
#	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \

	
# kcm keymaps
PRODUCT_COPY_FILES += \
    device/zte/V55/proprietary/usr/keychars/Generic.kcm:system/usr/keylayout/Generic.kcm \
    device/zte/V55/proprietary/usr/keychars/qwerty2.kcm:system/usr/keylayout/qwerty2.kcm \
    device/zte/V55/proprietary/usr/keychars/qwerty.kcm:system/usr/keylayout/qwerty.kcm \
    device/zte/V55/proprietary/usr/keychars/Virtual.kcm:system/usr/keylayout/Virtual.kcm

# kl keylayouts
PRODUCT_COPY_FILES += \
    device/zte/V55/proprietary/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/zte/V55/proprietary/usr/keylayout/matrix-keypad.kl:system/usr/keylayout/matrix-keypad.kl \
	device/zte/V55/proprietary/usr/keylayout/pmic8058_pwrkey.kl:system/usr/keylayout/pmic8058_pwrkey.kl \
    device/zte/V55/proprietary/usr/keylayout/8660_handset.kl:system/usr/keylayout/8660_handset.kl \
    device/zte/V55/proprietary/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/zte/V55/proprietary/usr/keylayout/ffa-keypad.kl:system/usr/keylayout/ffa-keypad.kl \
    device/zte/V55/proprietary/usr/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
    device/zte/V55/proprietary/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl
	
# idc files
PRODUCT_COPY_FILES += \
    device/zte/V55/proprietary/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/zte/V55/proprietary/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
	device/zte/V55/proprietary/usr/idc/qwerty.idc:system/usr/idc/atmel-touchscreen.idc \
    device/zte/V55/proprietary/usr/icu/icudt44l.dat:system/usr/icu/icudt44l.dat
	
# Audio files
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
	device/zte/V55/proprietary/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
	device/zte/V55/proprietary/lib/libacdbloader.so:system/lib/libacdbloader.so \
	device/zte/V55/proprietary/lib/libacdbloader.so:obj/lib/libacdbloader.so \
	device/zte/V55/proprietary/lib/libacdbmapper.so:system/lib/libacdbmapper.so \
	device/zte/V55/proprietary/lib/libacdbmapper.so:obj/lib/libacdbmapper.so \
	device/zte/V55/proprietary/lib/libaudcal.so:obj/lib/libaudcal.so \
	device/zte/V55/proprietary/lib/libaudio.so:obj/lib/libaudio.so \
	device/zte/V55/proprietary/lib/libdiag.so:obj/lib/libdiag.so \
	device/zte/V55/proprietary/lib/libaudcal.so:system/lib/libaudcal.so \
	device/zte/V55/proprietary/lib/libaudio.so:system/lib/libaudio.so \
	device/zte/V55/proprietary/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so \
	device/zte/V55/proprietary/lib/libaudiopolicy.so:obj/lib/libaudiopolicy.so \
	device/zte/V55/proprietary/lib/libdiag.so:system/lib/libdiag.so \
	device/zte/V55/proprietary/etc/media_profiles.xml:system/etc/media_profiles.xml \
	device/zte/V55/proprietary/etc/media_codecs.xml:system/etc/media_codecs.xml 

#Bluetooth setup
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/bin/brcm_patchram_plus:system/bin/brcm_patchram_plus \
#	device/zte/V55/proprietary/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
#	device/zte/V55/proprietary/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \
#	device/zte/V55/proprietary/etc/bluetooth/network.conf:system/etc/bluetooth/network.conf \
#	device/zte/V55/proprietary/lib/bluez-plugin/audio.so:system/lib/bluez-plugin/audio.so \
#	device/zte/V55/proprietary/lib/bluez-plugin/input.so:system/lib/bluez-plugin/input.so \
#	device/zte/V55/proprietary/lib/bluez-plugin/network.so:system/lib/bluez-plugin/network.so \
#	device/zte/V55/proprietary/lib/libbluedroid.so:system/lib/libbluedroid.so \
#	device/zte/V55/proprietary/lib/libbluetooth.so:system/lib/libbluetooth.so \
#	device/zte/V55/proprietary/lib/libbluetoothd.so:system/lib/libbluetoothd.so \
#	device/zte/V55/proprietary/lib/libdbus.so:system/lib/libdbus.so \
#	device/zte/V55/proprietary/bin/bluetoothd:system/bin/bluetoothd \
#	device/zte/V55/proprietary/bin/hciattach:system/bin/hciattach \
#	device/zte/V55/proprietary/bin/sdptool:system/bin/sdptool \
	



	
# GSM files
#PRODUCT_COPY_FILES += \
#	device/zte/V55/proprietary/lib/libril-qc-qmi-1.so:system/lib/libril-qc-qmi-1.so \
#	device/zte/V55/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
#	device/zte/V55/proprietary/lib/libqmi.so:system/lib/libqmi.so \
#	device/zte/V55/proprietary/lib/libdsutils.so:system/lib/libdsutils.so \
#	device/zte/V55/proprietary/lib/libqmiservices.so:system/lib/libqmiservices.so \
#	device/zte/V55/proprietary/lib/libidl.so:system/lib/libidl.so \
#	device/zte/V55/proprietary/lib/libdsi_netctrl.so:system/lib/libdsi_netctrl.so \
#	device/zte/V55/proprietary/lib/libnetmgr.so:system/lib/libnetmgr.so \
#	device/zte/V55/proprietary/lib/libqdp.so:system/lib/libqdp.so \
#	device/zte/V55/proprietary/lib/libtime_genoff.so:system/lib/libtime_genoff.so \
#	device/zte/V55/proprietary/lib/libreference-ril.so:system/lib/libreference-ril.so \
#	device/zte/V55/proprietary/lib/libreference-ril.so:obj/lib/libreference-ril.so \
#	device/zte/V55/proprietary/lib/libril.so:system/lib/libril.so \
#	device/zte/V55/proprietary/lib/libril.so:obj/lib/libril.so \
#	device/zte/V55/proprietary/bin/rild:system/bin/rild \
#	device/zte/V55/proprietary/bin/rild:obj/bin/rild \
#	device/zte/V55/proprietary/bin/netmgrd:system/bin/netmgrd \
#	device/zte/V55/proprietary/bin/ATFWD-daemon:system/bin/ATFWD-daemon \
#	device/zte/V55/proprietary/lib/libqc-opt.so:system/lib/libqc-opt.so \
	
#root dir
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/root/initlogo.rle:root/initlogo.rle \
	device/zte/V55/proprietary/root/sbin/resize2fs:root/sbin/resize2fs \
	device/zte/V55/proprietary/root/init.rc:root/init.rc \
	device/zte/V55/proprietary/root/ueventd.rc:root/ueventd.rc \
	device/zte/V55/proprietary/root/init.target.rc:root/init.target.rc \
	device/zte/V55/proprietary/root/init.qcom.sh:root/init.qcom.sh \
	device/zte/V55/proprietary/root/init.qcom.rc:root/init.qcom.rc \
	device/zte/V55/proprietary/root/init:root/init \
	device/zte/V55/proprietary/root/ueventd.rc:recovery/root/ueventd.rc \
	device/zte/V55/proprietary/root/init:recovery/root/init \
	device/zte/V55/recovery/init.rc:recovery/root/init.rc \
	device/zte/V55/proprietary/bin/sdcard:recovery/root/sbin/sdcard \
	device/zte/V55/proprietary/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
	
# Kernel modules
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/lib/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
	device/zte/V55/proprietary/lib/modules/cpaccess.ko:system/lib/modules/cpaccess.ko \
	device/zte/V55/proprietary/lib/modules/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
	device/zte/V55/proprietary/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
	device/zte/V55/proprietary/lib/modules/dma_test.ko:system/lib/modules/dma_test.ko \
	device/zte/V55/proprietary/lib/modules/evbug.ko:system/lib/modules/evbug.ko \
	device/zte/V55/proprietary/lib/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
	device/zte/V55/proprietary/lib/modules/ksapi.ko:system/lib/modules/ksapi.ko \
	device/zte/V55/proprietary/lib/modules/lcd.ko:system/lib/modules/lcd.ko \
	device/zte/V55/proprietary/lib/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
	device/zte/V55/proprietary/lib/modules/msm_tsif.ko:system/lib/modules/msm_tsif.ko \
	device/zte/V55/proprietary/lib/modules/oprofile.ko:system/lib/modules/oprofile.ko \
	device/zte/V55/proprietary/lib/modules/qce.ko:system/lib/modules/qce.ko \
	device/zte/V55/proprietary/lib/modules/qcedev.ko:system/lib/modules/qcedev.ko \
	device/zte/V55/proprietary/lib/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
	device/zte/V55/proprietary/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
	device/zte/V55/proprietary/lib/modules/tsif_chrdev.ko:system/lib/modules/tsif_chrdev.ko \
	device/zte/V55/proprietary/lib/modules/WCN1314_rf_ftm.ko:system/lib/modules/WCN1314_rf_ftm.ko \
	device/zte/V55/proprietary/lib/modules/wlan.ko:system/lib/modules/wlan.ko
	
# VOLD files
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/etc/vold.fstab:system/etc/vold.fstab \
	device/zte/V55/recovery/recovery.fstab:recovery/root/etc/recovery.fstab 

	
#adreno200 	
PRODUCT_COPY_FILES += \
    device/zte/V55/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
	device/zte/V55/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/zte/V55/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/zte/V55/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/zte/V55/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
	device/zte/V55/proprietary/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
	device/zte/V55/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
	device/zte/V55/proprietary/lib/libgsl.so:system/lib/libgsl.so \
	device/zte/V55/proprietary/lib/libC2D2.so:system/lib/libC2D2.so \
	device/zte/V55/proprietary/lib/libOpenVG.so:system/lib/libOpenVG.so \
	device/zte/V55/proprietary/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
#	device/zte/V55/proprietary/lib/liboverlay.so:system/lib/liboverlay.so \
#	device/zte/V55/proprietary/lib/libc2d2_z180.so:system/lib/libc2d2_z180 \

	
#firmware 	
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/etc/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
	device/zte/V55/proprietary/etc/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
	device/zte/V55/proprietary/etc/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
	device/zte/V55/proprietary/etc/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
	device/zte/V55/proprietary/etc/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \
	device/zte/V55/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
	device/zte/V55/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
	device/zte/V55/proprietary/etc/firmware/bcm.hcd:system/etc/firmware/bcm.hcd \
	device/zte/V55/proprietary/etc/firmware/dsps_fluid.b00:system/etc/firmware/dsps_fluid.b00 \
	device/zte/V55/proprietary/etc/firmware/dsps_fluid.b01:system/etc/firmware/dsps_fluid.b01 \
	device/zte/V55/proprietary/etc/firmware/dsps_fluid.b02:system/etc/firmware/dsps_fluid.b02 \
	device/zte/V55/proprietary/etc/firmware/dsps_fluid.b03:system/etc/firmware/dsps_fluid.b03 \
	device/zte/V55/proprietary/etc/firmware/dsps_fluid.mdt:system/etc/firmware/dsps_fluid.mdt \
	device/zte/V55/proprietary/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
	device/zte/V55/proprietary/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
	device/zte/V55/proprietary/etc/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw 

#modem Scripts 	
#PRODUCT_COPY_FILES += \
#	device/zte/V55/proprietary/etc/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
#	device/zte/V55/proprietary/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
#	device/zte/V55/proprietary/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
	
	
#codecs	
PRODUCT_COPY_FILES += \
    device/zte/V55/proprietary/lib/libOmxAacDec.so:/system/lib/libOmxAacDec.so \
    device/zte/V55/proprietary/lib/libOmxQcelp13Dec.so:/system/lib/libOmxQcelp13Dec.so \
    device/zte/V55/proprietary/lib/libOmxEvrcDec.so:/system/lib/libOmxEvrcDec.so \
    device/zte/V55/proprietary/lib/libOmxWmaDec.so:/system/lib/libOmxWmaDec.so \
	device/zte/V55/proprietary/lib/libmmparser.so:/system/lib/libmmparser.so \
	device/zte/V55/proprietary/lib/libDivxDrm.so:/system/lib/libDivxDrm.so \
	device/zte/V55/proprietary/lib/libmmparser_divxdrmlib.so:/system/lib/libmmparser_divxdrmlib.so \
	device/zte/V55/proprietary/lib/libmmosal.so:/system/lib/libmmosal.so \
#    device/zte/V55/proprietary/lib/libOmxQcelp13Enc.so:/system/lib/libOmxQcelp13Enc.so \
#    device/zte/V55/proprietary/lib/libOmxAmrEnc.so:/system/lib/libOmxAmrEnc.so \
#	device/zte/V55/proprietary/lib/libOmxEvrcEnc.so:/system/lib/libOmxEvrcEnc.so \
#	device/zte/V55/proprietary/lib/libOmxAacEnc.so:/system/lib/libOmxAacEnc.so \

#Sensors
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/lib/hw/sensors.msm8660.so:system/lib/hw/sensors.msm8660.so \
	device/zte/V55/proprietary/lib/libmpl_sys_jni.so:system/lib/libmpl_sys_jni.so \
	device/zte/V55/proprietary/lib/libmpl.so:system/lib/libmpl.so \
	device/zte/V55/proprietary/etc/thermald.conf:system/etc/thermald.conf \
	device/zte/V55/proprietary/framework/com.invensense.android.hardware.jar:system/framework/com.invensense.android.hardware.jar \
	device/zte/V55/proprietary/lib/libmllite.so:system/lib/libmllite.so \
	device/zte/V55/proprietary/lib/libmlplatform.so:system/lib/libmlplatform.so \
#	device/zte/V55/proprietary/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
#	device/zte/V55/proprietary/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \

#wifi
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/etc/wifi/apsta_bcm4330_b2.bin:system/etc/wifi/apsta_bcm4330_b2.bin \
	device/zte/V55/proprietary/etc/wifi/bcm4330_b2.bin:system/etc/wifi/bcm4330_b2.bin \
	device/zte/V55/proprietary/etc/wifi/fw_bcm4330_apsta_b2.bin:system/etc/wifi/fw_bcm4330_apsta_b2.bin \
	device/zte/V55/proprietary/etc/wifi/fw_bcm4330_b2.bin:system/etc/wifi/fw_bcm4330_b2.bin \
	device/zte/V55/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 
	
#camera
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
	device/zte/V55/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
	device/zte/V55/proprietary/lib/libmmjpeg.so:obj/lib/libmmjpeg.so \
    device/zte/V55/proprietary/lib/liboemcamera.so:obj/lib/liboemcamera.so \
    device/zte/V55/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
	device/zte/V55/proprietary/lib/libgemini.so:system/lib/libgemini.so \
	device/zte/V55/proprietary/lib/libmmmpo.so:system/lib/libmmmpo.so \
    device/zte/V55/proprietary/bin/v4l2-qcamera-app:system/bin/v4l2-qcamera-app \
	device/zte/V55/proprietary/bin/mm-qcamera-daemon:system/bin/mm-qcamera-daemon \
	device/zte/V55/proprietary/bin/mm-qcamera-test:system/bin/mm-qcamera-test \
	device/zte/V55/proprietary/bin/mm-mpo-enc-test:system/bin/mm-mpo-enc-test \
	device/zte/V55/proprietary/bin/mm-qcamera-testsuite-client:system/bin/mm-qcamera-testsuite-client \
#	device/zte/V55/proprietary/lib/libcamera.so:obj/lib/libcamera.so \
#   device/zte/V55/proprietary/lib/libcamera.so:system/lib/libcamera.so \
#	device/zte/V55/proprietary/lib/hw/camera.msm8660.so:obj/lib/camera.msm8660.so \
#   device/zte/V55/proprietary/lib/hw/camera.msm8660.so:system/lib/hw/camera.msm8660.so \


#wiperiface
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/lib/libcommondefs.so:system/lib/libcommondefs.so \
	device/zte/V55/proprietary/lib/libloc_api-rpc-qc.so:system/lib/libloc_api-rpc-qc.so \
    device/zte/V55/proprietary/lib/libloc_ext.so:system/lib/libloc_ext.so \
    device/zte/V55/proprietary/lib/libwiperjni.so:system/lib/libwiperjni.so \
    device/zte/V55/proprietary/lib/libtcpfinaggr.so:system/lib/libtcpfinaggr.so \

# Binary files
PRODUCT_COPY_FILES += \
	device/zte/V55/proprietary/bin/battery_charging:system/bin/battery_charging \
	device/zte/V55/proprietary/bin/bridgemgrd:system/bin/bridgemgrd \
	device/zte/V55/proprietary/bin/port-bridge:system/bin/port-bridge \
	device/zte/V55/proprietary/bin/qmiproxy:system/bin/qmiproxy \
	device/zte/V55/proprietary/bin/mpdecision:system/bin/mpdecision \
	device/zte/V55/proprietary/bin/ds_fmc_appd:system/bin/ds_fmc_appd \
	device/zte/V55/proprietary/bin/qmuxd:system/bin/qmuxd \
	device/zte/V55/proprietary/bin/dcvsd:system/bin/dcvsd \
	device/zte/V55/proprietary/bin/rmt_storage:system/bin/rmt_storage \
	device/zte/V55/proprietary/bin/thermald:system/bin/thermald \
	device/zte/V55/proprietary/bin/usbhub:system/bin/usbhub \
	device/zte/V55/proprietary/bin/wiperiface:system/bin/wiperiface \
	device/zte/V55/proprietary/bin/usbhub_init:system/bin/usbhub_init \
	device/zte/V55/proprietary/bin/sdcard:system/bin/sdcard \
	device/zte/V55/proprietary/bin/radish:system/bin/radish \
	device/zte/V55/proprietary/bin/hdmid:system/bin/hdmid \
#	device/zte/V55/proprietary/bin/ash:system/bin/sh \
