# task6
ORIGINALAPK=original.apk
RESULTAPK=result.apk

apktool d $ORIGINALAPK &&
find original -type f -exec sed -i 's/Lru\/sberbank_sbbol/Lru\/test_sbbol/g' {} \; &&
find original -type f -exec sed -i 's/ru.sberbank_sbbol/ru.test_sbbol/g' {} \; && 
mv original/smali/ru/sberbank_sbbol original/smali/ru/test_sbbol &&
mv original/smali_classes2/ru/sberbank_sbbol original/smali_classes2/ru/test_sbbol &&
apktool b original -o $RESULTAPK &&
keytool -genkey -noprompt -v -keystore keystore -alias signkey -dname "CN=mqttserver.test.com, OU=ID, O=IBM, L=Hursley, S=Hants, C=GB" -keyalg RSA -keysize 2048 -validity 20000 --storepass password -keypass password &&
jarsigner -verbose -keystore keystore -storepass password -keypass password $RESULTAPK signkey