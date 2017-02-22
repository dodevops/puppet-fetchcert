# Default parameters for the fetchcert::fetch type
#
# @param source_host Hostname or IP of the host providing the certificate
# @param source_port Port, that provides the certificate. Defaults to 443
# @param openssl_command Command to start openssl
class fetchcert (
  $source_host = undef,
  $source_port = 443,
  $openssl_command = '/usr/bin/openssl'
) {

  $_fetchcert_fetch = hiera_hash('fetchcert::fetch', undef)

  if ($_fetchcert_fetch) {
    create_resources('fetchcert::fetch', $_fetchcert_fetch)
  }

}
