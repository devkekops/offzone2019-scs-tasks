# task5
ORIGINALAPK=original.apk
RESULTAPK=result.apk

apktool d $ORIGINALAPK &&
sed -i "" 's/*/-----BEGIN CERTIFICATE-----
MIIDoTCCAomgAwIBAgIGDjGTCCZ7MA0GCSqGSIb3DQEBCwUAMCgxEjAQBgNVBAMMCW1pdG1wcm94eTESMBAGA1UECgwJbWl0bXByb3h5MB4XDTE5MDYxMzE0MTgxN1oXDTIyMDYxNDE0MTgxN1owKDESMBAGA1UEAwwJbWl0bXByb3h5MRIwEAYDVQQKDAltaXRtcHJveHkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDF2L0RojeqB\/6PMImRyc6svOOD9eGpApBqC5EVvnl1YZLRnDhU3LgpXfuqpq4b\/DLW8A+IPTlNdcgBjaUpT+pixi7mSMgPIntuxs5SzJoCJN2eAELqoGxhhihYihRbjpTceX1pPLwqpAaWCPGcBxsYcSN78Im3XRHl0yXQn82HhysmiLZNEF6L78rB3Rx97kPP9pRKKDzRqE0Cs1xD+RPD9D6yvIL3A3FaWBdH0CoEKWPa5ZEG6oh5KpzFL\/oI4i\/\/6SWsdJ0IWjiAkcuZX4ah37ToX+P36SnkZZuO1+YKdk99qI+J8XuKpV8ItS5ySHzlU7xiSEfNNUY7eO5ZH5XAgMBAAGjgdAwgc0wDwYDVR0TAQH\/BAUwAwEB\/zARBglghkgBhvhCAQEEBAMCAgQweAYDVR0lBHEwbwYIKwYBBQUHAwEGCCsGAQUFBwMCBggrBgEFBQcDBAYIKwYBBQUHAwgGCisGAQQBgjcCARUGCisGAQQBgjcCARYGCisGAQQBgjcKAwEGCisGAQQBgjcKAwMGCisGAQQBgjcKAwQGCWCGSAGG+EIEATAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0OBBYEFD\/MqlxGruoL2kcSUPxE4GhdAT5sMA0GCSqGSIb3DQEBCwUAA4IBAQAXW9ouMgehqTTqT33UciQR6r6xL3of7x2aiZMqN8DWQCQWUF11AQEGFB\/cMXps1TCUk1TbR0FfAnIi4be0Eu6AMA+Tifih6XyQAQlcuqmcot\/Vj9g8v3hPVUebkx9r2pRw1963Thp4zjwUjWRMHvp8KK4O3b+hF9fH4ju\/xBzKvAEOuveDK+lj7oKlqhXjq\/z0LuahNZRWoy+ZOX1UBN7EablR22FPs4IOHF8TAlk\/72TXXIAlByRc6e7+oxULoEvV3fT3h9ZyWbR4w461E20vdbS5Nr44MWCRUMCTX5ToSIbdbVws3ZTiznjaMlHUDjGa9RTUWwIaBDi9OxYeOgpm
-----END CERTIFICATE-----/g' original/res/raw/thawte_ev_rsa_ca_2018.cer && 
apktool b --use-aapt2 original -o $RESULTAPK &&
keytool -genkey -noprompt -v -keystore keystore -alias signkey -dname "CN=mqttserver.test.com, OU=ID, O=IBM, L=Hursley, S=Hants, C=GB" -keyalg RSA -keysize 2048 -validity 20000 --storepass password -keypass password &&
jarsigner -verbose -keystore keystore -storepass password -keypass password $RESULTAPK signkey