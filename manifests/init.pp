# @summary Defaults and hiera support for fetchcert
# @param source_port Port, that provides the certificate. Defaults to 443
# @param openssl_command Command to start openssl
class fetchcert (
  Integer $source_port,
  String $openssl_command,
  Boolean $manage_package,
  String $package_name,
  String $package_ensure,
  String $package_provider,
) {

  $_fetchcert_fetch = lookup('fetchcert::fetch', { merge => hash, default_value => undef })

  if ($_fetchcert_fetch) {
    create_resources('fetchcert::fetch', $_fetchcert_fetch)
  }

}
