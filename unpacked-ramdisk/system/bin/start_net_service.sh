#!/sbin/sh

toybox chcon u:object_r:netd_exec:s0 /system/bin/netd
chmod 755 ip6tables
chmod 755 iptables
chmod 755 netd
chmod 755 netutils-wrapper-1.0
chmod 755 /system/bin/sh
chmod 755 /system/bin/toybox
mount /dev/block/by-name/modem /vendor/firmware_mnt  -o gid=1000,fmask=0337,dmask=0227,codepage=437,iocharset=iso8859-1,shortname=lower
mkdir -p /mnt/vendor/persist
mount /dev/block/bootdevice/by-name/persist /mnt/vendor/persist
cp /vendor/etc/wifi/WCNSS_qcom_cfg.ini /etc/firmware/wlan/qca_cld
cp /vendor/etc/wifi/WCNSS_qcom_cfg.ini /mnt/vendor/persist/wlan/qca_cld/WCNSS_qcom_cfg.ini
cp /vendor/etc/wifi/wpa_supplicant.conf /data/misc/wifi/wpa_supplicant.conf
toybox chmod 0644 /etc/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini
toybox chmod 0644 /mnt/vendor/persist/wlan/qca_cld/WCNSS_qcom_cfg.ini
toybox chmod 0775 cnss-daemon
toybox chmod 0775 qrtr-ns
toybox chmod 0775 tftp_server
toybox chmod 0775 irsc_util
toybox chmod 0775 rmt_storage
toybox chmod 0775 pm-service
toybox chmod 0775 pd-mapper
toybox chmod 0775 pm-proxy
toybox chmod 0775 servicemanager
start servicemanager
start hwservicemanager
start vndservicemanager
start irsc_util
start rmt_storage
start vendor.qrtr-ns
start tftp_server
start per_mgr
start pd_mapper
start per_proxy
start cnss-daemon
echo 1 > /dev/ipa
sleep 1
ziptool unzip /system/bin/qca_cld3_wlan.zip -d /tmp/
toybox insmod /tmp/qca_cld3_wlan.ko
#toybox start netd
sleep 1
mkdir -p /data/misc/wifi/sockets
toybox chown 1010:1010 /data/misc/wifi/sockets
toybox chmod 0770 /data/misc/wifi/sockets
toybox chcon u:object_r:wpa_socket:s0 /data/misc/wifi/sockets
touch /data/misc/wifi/wpa_supplicant.conf
toybox chown 1010:1010 /data/misc/wifi/wpa_supplicant.conf
toybox chmod 0770 /data/misc/wifi/wpa_supplicant.conf
toybox chmod 0775 wpa_supplicant
toybox chmod 0775 wpa_cli
start wpa_supplicant
