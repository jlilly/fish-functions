# Defined in - @ line 1
function get-ca-list
	awk -v cmd='openssl x509 -noout -subject' '
                /BEGIN/{close(cmd)};{print | cmd}' </etc/ssl/certs/ca-certificates.crt
end
