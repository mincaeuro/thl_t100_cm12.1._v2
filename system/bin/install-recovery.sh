#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8984576 01480c30324474c8a779e1af630374eb63dec331 6418432 834bd64059784e26075386acce4a5e69371af137
fi

if ! applypatch -c EMMC:/dev/recovery:8984576:01480c30324474c8a779e1af630374eb63dec331; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/bootimg:6418432:834bd64059784e26075386acce4a5e69371af137 EMMC:/dev/recovery 01480c30324474c8a779e1af630374eb63dec331 8984576 834bd64059784e26075386acce4a5e69371af137:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
