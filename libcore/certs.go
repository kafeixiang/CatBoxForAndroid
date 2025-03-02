package libcore

import (
	"crypto/x509"
	"log"
	_ "unsafe" // for go:linkname

	scribe "github.com/AntiNeko/TLS-scribe"
)

//go:linkname systemRoots crypto/x509.systemRoots
var systemRoots *x509.CertPool

func updateRootCACerts(pem []byte) {
	x509.SystemCertPool()
	roots := x509.NewCertPool()
	if !roots.AppendCertsFromPEM(pem) {
		log.Println("failed to append certificates from pem")
		return
	}
	systemRoots = roots
	log.Println("external ca.pem was loaded")
}

//go:linkname initSystemRoots crypto/x509.initSystemRoots
func initSystemRoots()

func PinCert(target, serverName string) string {
	r, err := scribe.Execute(target, serverName)
	if err != nil {
		return ""
	}

	return r
}
