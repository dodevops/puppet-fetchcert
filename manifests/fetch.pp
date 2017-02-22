# Fetch a certificate from a remote host and download it to a local file.
#
# @param source_host Hostname or IP of the host providing the certificate
# @param source_port Port, that provides the certificate. Defaults to 443
# @param target Target file path, defaults to type name
# @param openssl_command Command to start openssl
define fetchcert::fetch (
  $source_host     = undef,
  $source_port     = undef,
  $target          = undef,
  $openssl_command = undef
) {

  include fetchcert

  $_source_host = pick($source_host, $fetchcert::source_host)
  $_source_port = pick($source_port, $fetchcert::source_port)
  $_openssl_command = pick($openssl_command, $fetchcert::openssl_command)
  $_target = pick($target, $name)

  $_s_client =
    "${_openssl_command} s_client -connect ${_source_host}:${_source_port}"

  $_x509 =
    "${_openssl_command} x509 -outform PEM -out ${_target}"

  exec {
    "fetchcert.${_source_host}:${_source_port}:${_target}":
      command => "${_s_client} </dev/null 2>/dev/null | ${_x509}",
      creates => $_target
  }

}