#! /system/bin/sh

#ifdef OPLUS_ARCH_EXTENDS
#HuangZhenkun@ANDROID.RECOVERY.43992,2020/08/04,add for recovery UI & Cryptoeng decoupling
function prepareRes() {
    resUI=`getprop ro.product.brand.ui`
    if [ -z "$resUI" ]; then
        resUI="ColorOS"
    fi
    cp -af /res/$resUI/. /res
}

function prepareCryptoeng() {
    DynamicPartitions=`getprop ro.boot.dynamic_partitions`
    if [ "$DynamicPartitions" == "true" ]; then
        echo "use DynamicPartitions"
        mount -t ext4 -o ro /dev/block/mapper/odm /odm
        cp -af /odm/vendor/firmware/cryptoeng.* /vendor/firmware
        umount -l /odm
    else
        echo "not use DynamicPartitions,not currently supported"
    fi
}
#endif /* OPLUS_ARCH_EXTENDS */

case "$1" in
    #ifdef OPLUS_ARCH_EXTENDS
    #HuangZhenkun@ANDROID.RECOVERY.43992,2020/08/04,add for recovery UI & Cryptoeng decoupling
    prepareEnv)
        prepareRes
        ;;
    #endif /* OPLUS_ARCH_EXTENDS */
esac