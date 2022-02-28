#!/system/bin/sh
para_list=$@

#operate date begin
start=$(date "+%Y-%m-%d %H:%M:%S")
echo "operate data begin: ${start}"

#You should add your sh operation in your own area you belongs to
#=====================OS Begin============================
    #ifdef OPLUS_FEATURE_RECOVERY_RESET
    #Bin.Wang@ROM.Framework,2019-08-22,Add for HEYTAP change name.
    #1. migrate necessary data to backup directory
    mkdir -p /data/oppo/common/otasave/

    #HeytapMusic
    mkdir -p /data/oppo/common/otasave/HeytapMusic/
    cp -rf /data/data/com.oppo.music/databases/* /data/oppo/common/otasave/HeytapMusic/
    rm -rf /data/data/com.oppo.music/databases/*
    cp -rf /data/data/com.oppo.music/shared_prefs/* /data/oppo/common/otasave/HeytapMusic/
    rm -rf /data/data/com.oppo.music/shared_prefs/*

    #FileManager
    mkdir -p /data/oppo/common/otasave/FileManager/
    cp -rf /data/data/com.coloros.providers.fileinfo/databases/* /data/oppo/common/otasave/FileManager/
    rm -rf /data/data/com.coloros.providers.fileinfo/databases/*

    #HTUserCenter
    mkdir -p /data/oppo/common/otasave/HTUserCenter/
    cp -rf /data/data/com.heytap.usercenter/databases/* /data/oppo/common/otasave/HTUserCenter/
    rm -rf /data/data/com.heytap.usercenter/databases/*

    #DocVault
    #mkdir -p /data/oppo/common/otasave/DocVault/
    #mv -f /data/data/com.os.docvault/databases /data/oppo/common/otasave/DocVault/
    #mv -f /data/data/com.os.docvault/files /data/oppo/common/otasave/DocVault/
    #mv -f /data/data/com.os.docvault/shared_prefs /data/oppo/common/otasave/DocVault/

    chmod -R 770 /data/oppo/common/otasave/
    chown -R 1000:2001 /data/oppo/common/otasave/
    #restorecon -RF /data/oppo/common/otasave/

    #2. remove old apks and data directory
    #HeytapMusic
    rm -rf /data/app/com.oppo.music-*
    rm -rf /data/data/com.oppo.music
    rm -rf /data/user_de/0/com.oppo.music

    #FileManager
    rm -rf /data/app/com.coloros.providers.fileinfo-*
    rm -rf /data/data/com.coloros.providers.fileinfo
    rm -rf /data/user_de/0/com.coloros.providers.fileinfo

    #HTUserCenter
    rm -rf /data/app/com.heytap.usercenter-*
    rm -rf /data/data/com.heytap.usercenter
    rm -rf /data/user_de/0/com.heytap.usercenter

    #DocVault
    #rm -rf /data/app/DocVault
    #rm -rf /data/app/com.os.docvault
    #rm -rf /data/app/com.os.docvault-*
    #rm -rf /data/data/com.os.docvault
    #rm -rf /data/user_de/0/com.os.docvault

    #Breeno Space
    rm -rf /data/app/PersonalAssistant
    rm -rf /data/app/com.coloros.personalassistant-*
    rm -rf /data/data/com.coloros.personalassistant
    rm -rf /data/user_de/0/com.coloros.personalassistant

    #OtaUI
    rm -rf /data/app/com.oppo.otaui-*
    rm -rf /data/data/com.oppo.otaui
    rm -rf /data/user_de/0/com.oppo.otaui
#=====================OS End==============================

#=====================Android Begin========================
    #ifdef OPLUS_FEATURE_RECOVERY_RESET
    #HuangChaopeng@PSW.AD.Ota.274348,2020-08-17,Add for delete oplus_cpt_list.xml.
    #oppo_cpt_list.xml
    rm -rf /data/format_unclear/compatibility/oplus_cpt_list.xml

    #Add for delete data/reserve, when Q update to R
    rm -vrf /data/reserve
#=====================Android End==========================

#=====================BSP Begin============================
#=====================BSP End==============================

#=====================Multi Begin==========================
sed -i '/name="oppo_default_ringtone"/d' /data/system/users/0/settings_system.xml
sed -i '/name="oppo_default_ringtone_sim2"/d' /data/system/users/0/settings_system.xml
sed -i '/name="ringtone_sim2"/d' /data/system/users/0/settings_system.xml
sed -i '/name="ringtone"/d' /data/system/users/0/settings_system.xml
#=====================Multi End============================

#=====================NetWork Begin========================
#=====================NetWork End==========================

#operate end
end=$(date "+%Y-%m-%d %H:%M:%S")
echo "operate data end: ${end}"

interval=$(($(($(date +%s -d "$end")-$(date +%s -d "$start")))))
echo "operate data cost: $interval seconds"
