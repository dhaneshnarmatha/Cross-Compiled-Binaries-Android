# Generates ca-certificate.crt file from .0 files present on device
mkdir -p $MODDIR/system/etc/security
if [ -f "$(dirname $MOUNTPATH)/mirror/system/etc/security/ca-certificates.crt" ]; then
  cp -f $(dirname $MOUNTPATH)/mirror/system/etc/security/ca-certificates.crt $MODDIR/system/etc/security/ca-certificates-wget2.crt
else
  for i in $(dirname $MOUNTPATH)/mirror/system/etc/security/cacerts*/*.0; do
    echo "$(sed -n "/BEGIN CERTIFICATE/,/END CERTIFICATE/p" $i)" >> $MODDIR/system/etc/security/ca-certificates-wget2.crt
  done
fi
echo "etc/security/ca-certificates-wget2.crt" >> $MODDIR/.$ibinary
