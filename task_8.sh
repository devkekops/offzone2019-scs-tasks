# task6
ORIGINALAPK=original.apk
RESULTAPK=result.apk

apktool d $ORIGINALAPK &&
sed -i "" 's/ru.sberbank_sbbol/com.test_sbbol/g' original/AndroidManifest.xml && 
apktool b original -o $RESULTAPK &&
keytool -genkey -noprompt -v -keystore keystore -alias signkey -dname "CN=mqttserver.test.com, OU=ID, O=IBM, L=Hursley, S=Hants, C=GB" -keyalg RSA -keysize 2048 -validity 20000 --storepass password -keypass password &&
jarsigner -verbose -keystore keystore -storepass password -keypass password $RESULTAPK signkey