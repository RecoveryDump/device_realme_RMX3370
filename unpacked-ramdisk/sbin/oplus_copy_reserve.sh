#!/system/bin/sh

#reserve image copy begin
start=$(date "+%Y-%m-%d %H:%M:%S")
echo "reserve image copy begins: ${start}"


mkdir -vp /data/reserve/ -m 775
echo "/data/reserve folder created:"
cp -v /tmp/reserve.img /data/reserve/reserve.img
chmod -v 775 /data/reserve/reserve.img
chown -vR 1000:1000 /data/reserve/
chcon -vR u:object_r:apk_data_file:s0 /data/reserve/
sleep 0.5
sync
sleep 1
echo "copy of reserve.img from tmpfs to /data/reserve is done"
rm -vrf /tmp/reserve.img

#reserve image copy end
end=$(date "+%Y-%m-%d %H:%M:%S")
echo "reserve image copy ends: ${end}"

interval=$(($(($(date +%s -d "$end")-$(date +%s -d "$start")))))
echo "reserve image copy took: $interval seconds"