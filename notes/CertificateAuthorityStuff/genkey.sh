read -p "Enter a component name: " component
# This script assumes the CA has already been created with password specified
# Create a keypair for your new java keystore (output as a .jks file)
keytool -genkeypair -alias $component -keyalg EC -keysize 256 -sigalg SHA384withECDSA -validity 365 -keystore $component.jks -storepass password -keypass password -dname "CN=$component, OU=df, O=df, L=df, S=df, C=df"

# import the CA's certificate
keytool -import -keystore $component.jks -file ca.crt -alias thecaroot -storepass password -noprompt

# generate a certificate signing request
keytool -keystore $component.jks -certreq -alias $component -keyalg EC -file $component.csr -storepass password

# have the CA sign the request
openssl x509 -req -SHA384 -days 365 -in $component.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out $component.crt -passin pass:password

# import the signed certificate on the same alias where the key was generated in the .jks
keytool -importcert -keystore $component.jks -file $component.crt -alias $component -storepass password

# delete unnecessary files 
rm $component.crt
rm $component.csr

# create the .jks.pw and .pw files
echo -n "password" > $component.pw
echo -n "password" > $component.jks.pw
