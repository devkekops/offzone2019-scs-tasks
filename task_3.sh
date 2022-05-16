# task4
ORIGINALAPK=original.apk
RESULTAPK=result.apk

apktool d $ORIGINALAPK && 
sed -i "" 's/iget-boolean v0, p0, Lcom\/kavsdk\/o\/dp;->論尺寸為脈之大要會:Z/const\/4 v0, 0x0/g' original/smali_classes2/com/kavsdk/o/dp.smali &&
apktool b original -o $RESULTAPK &&
keytool -genkey -noprompt -v -keystore keystore -alias signkey -dname "CN=mqttserver.test.com, OU=ID, O=IBM, L=Hursley, S=Hants, C=GB" -keyalg RSA -keysize 2048 -validity 20000 --storepass password -keypass password &&
jarsigner -verbose -keystore keystore -storepass password -keypass password $RESULTAPK signkey

