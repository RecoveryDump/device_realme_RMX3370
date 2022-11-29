#!/sbin/sh
cp /vendor/etc/wifi/WCNSS_qcom_cfg.ini /mnt/vendor/persist/wlan/qca_cld/WCNSS_qcom_cfg.ini
cp /vendor/etc/wifi/WCNSS_qcom_cfg.ini /etc/firmware/wlan/qca_cld
stop wpa_supplicant
stop netd
/system/bin/rmmod /system/bin/qca_cld3_wlan.ko
#toybox rmmod wlan
stop cnss-daemon
stop per_proxy
stop pd_mapper
stop per_mgr
stop tftp_server
stop rmt_storage
stop vendor.qrtr-ns
stop irsc_util
stop vndservicemanager
#stop hwservicemanager
#ifdef OPLUS_FEATURE_AGINGTEST
#toybox stop servicemanager
#endif
umount /mnt/vendor/persist
umount /vendor/firmware_mnt
rm /tmp/aplist.txt
