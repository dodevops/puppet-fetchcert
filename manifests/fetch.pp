# Fetch a certificate from a remote host and download it to a local file.
#
# @param source_host Hostname or IP of the host providing the certificate
# @param target Target file path, defaults to type name
# @param source_port Port, that provides the certificate
# @param openssl_command Command to start openssl
# @param package_name Name of the os package, that contains the OpenSSL command
# @param package_ensure Ensure for the package type
define fetchcert::fetch (
  String $source_host,
  Optional[String] $target           = undef,
  Optional[Integer] $source_port     = undef,
  Optional[String] $openssl_command  = undef,
  Optional[Boolean] $manage_package  = undef,
  Optional[String] $package_name     = undef,
  Optional[String] $package_ensure   = undef,
  Optional[String] $package_provider = undef,
) {

  include fetchcert

  $_package_name = $package_name ? {
    undef   => $fetchcert::package_name,
    default => $package_name,
  }

  $_source_port = $source_port ? {
    undef   => $fetchcert::source_port,
    default => $source_port
  }

  $_openssl_command = $openssl_command ? {
    undef   => $fetchcert::openssl_command,
    default => $openssl_command
  }

  $_target = $target ? {
    undef   => $name,
    default => $target
  }

  $_package_provider = $package_provider ? {
    undef   => $fetchcert::package_provider,
    default => $package_provider,
  }

  $_package_ensure = $package_ensure ? {
    undef   => $fetchcert::package_ensure,
    default => $package_ensure,
  }

  $_manage_package = $manage_package ? {
    undef   => $fetchcert::manage_package,
    default => $manage_package
  }

  $_exec_title = "fetchcert.${source_host}:${_source_port}:${_target}"

  if $_manage_package and !defined(Package[$_package_name]) {
    package {
      $_package_name:
        ensure   => $_package_ensure,
        provider => $_package_provider,
        before   => Exec[$_exec_title]
    }
  }

  $_s_client = "${_openssl_command} s_client -connect ${source_host}:${_source_port}"
  $_x509 = "${_openssl_command} x509 -outform PEM -out ${_target}"

  exec {
    $_exec_title:
      command => "${_s_client} </dev/null 2>/dev/null | ${_x509}",
      creates => $_target,
  }

}
