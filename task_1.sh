# task1
ORIGINALAPK=original.apk
RESULTAPK=result.apk

apktool d $ORIGINALAPK &&
sed -i "" 's/<string name=\"app_name\">Сбербанк<\/string>/<string name=\"app_name\">NewName<\/string>/g' original/res/values/strings.xml && 
apktool b --use-aapt2 original -o $RESULTAPK &&
keytool -genkey -noprompt -v -keystore keystore -alias signkey -dname "CN=mqttserver.test.com, OU=ID, O=IBM, L=Hursley, S=Hants, C=GB" -keyalg RSA -keysize 2048 -validity 20000 --storepass password -keypass password &&
jarsigner -verbose -keystore keystore -storepass password -keypass password $RESULTAPK signkey