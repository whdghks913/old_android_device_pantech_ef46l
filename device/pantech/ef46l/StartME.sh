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

cp ./ril/telephony/java/com/android/internal/telephony/SkyQualcommRIL.java ../../../frameworks/opt/telephony/src/java/com/android/internal/telephony

cp ./bluetooth/bdroid_buildcfg.h ../../../external/bluetooth/bluedroid/audio_a2dp_hw

echo ""
echo "    Finished by Source PATCH"
echo ""
echo "    Script Will start setup-makefiles.sh"

./setup-makefiles.sh