# task4
ORIGINALAPK=original.apk
RESULTAPK=result.apk

apktool d $ORIGINALAPK &&
find original -type f -exec sed -i "" 's/Lru\/sberbankmobile/Lru\/test_sbol/g' {} \; &&
find original -type f -exec sed -i "" 's/ru.sberbankmobile/ru.test_sbol/g' {} \; &&
mv original/smali/ru/sberbankmobile original/smali/ru/test_sbol &&
mv original/smali_classes8/ru/sberbankmobile original/smali_classes8/ru/test_sbol &&
apktool b --use-aapt2 original -o $RESULTAPK &&
keytool -genkey -noprompt -v -keystore keystore -alias signkey -dname "CN=mqttserver.test.com, OU=ID, O=IBM, L=Hursley, S=Hants, C=GB" -keyalg RSA -keysize 2048 -validity 20000 --storepass password -keypass password &&
jarsigner -verbose -keystore keystore -storepass password -keypass password $RESULTAPK signkey