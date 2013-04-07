clear
echo ""
echo ""
echo "   ---------------------------------"
sleep 0.5
echo "    CM10.1 patch"
sleep 0.5
echo "    Source by hPa and Edit by Mir"
sleep 0.5
echo "   ---------------------------------"
sleep 0.5
echo "    Shell Script will start"
sleep 0.5
echo "   ---------------------------------"
sleep 0.5

# PATH DEVICE
DEVICE=ef46l

# ril PATH
cp ./ril/telephony/java/com/android/internal/telephony/SkyQualcommRIL.java ../../../frameworks/opt/telephony/src/java/com/android/internal/telephony

# install bdroid_buildcfg.h
cp ./bluetooth/bdroid_buildcfg.h ../../../external/bluetooth/bluedroid/audio_a2dp_hw

# ERROR FIX - no rules to make "out/target/product/$DEVICE/obj/KERNEL_OBJ/usr"
mkdir -p ../../../out/target/product/$DEVICE/obj/KERNEL_OBJ/usr

# ERROR FIX - Symlink
# ERROR : prebuilts/gcc/linux-x86/host/i686-linux-glibc2.7-4.6/bin/../sysroot/usr/include/bits/byteswap.h:22:3: error: #error "Never use <bits/byteswap.h> directly; include <byteswap.h> instead."
if [ ! -s /usr/include/bits ]; then
sudo mkdir -p /usr/include/bits
sudo ln -s /usr/include/byteswap.h /usr/include/bits/byteswap.h
sudo ln -s /usr/include/linux/stat.h /usr/include/bits/stat.h
fi

# ERROR FIX - include - ClentSocket
# ERROR : error: '__bswap_16' was not declared in this scope
# prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.7-4.6/sysroot/usr/include/bits/byteswap.h : __bswap_16, The File(byteswap.h)is /usr/include
#
#### sgrep __bswap_16
#whdghks913@Ubuntu:~/cm-10.1/system$ sgrep __bswap_16
#./prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.7-4.6/sysroot/usr/include/netinet/in.h:379:#   #define ntohs(x)	__bswap_16 (x)
#./prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.7-4.6/sysroot/usr/include/netinet/in.h:381:#   define htons(x)	__bswap_16 (x)
#./prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.7-4.6/sysroot/usr/include/bits/byteswap.h:35:# define __bswap_16(x) \
#./prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.7-4.6/sysroot/usr/include/bits/byteswap.h:48:# define __bswap_16(x) \
#./prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.7-4.6/sysroot/usr/include/byteswap.h:30:#define bswap_16(x) __bswap_16 (x)
cp ./ClentSocket/* ../../../cts/suite/audio_quality/lib/include


echo ""
echo "    Finished by Source PATCH"
echo ""
echo "    Script Will start setup-makefiles.sh"

./setup-makefiles.sh
sleep 1
