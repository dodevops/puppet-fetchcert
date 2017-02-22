# fetchcert

[![Travis](https://img.shields.io/travis/dodevops/puppet-fetchcert.svg)](https://travis-ci.org/dodevops/puppet-fetchcert)

Fetch a remote certificate and store it locally

## Introduction

This module fetches a remote certificate using the openssl s_client
function and stores it to a local file.

## Dependencies

* puppetlabs-stdlib
* "openssl" command is available locally (can usually be simply installed
with the "package"-type)

## Usage

### With puppet

To download a certificate, simply use the defined type "fetchcert::fetch":

```
fetchcert::fetch {
  '/tmp/mycert.pem':
    source_host => 'mysource.example.com'
}
```

### With hiera

This module includes hiera support. Just include the class "fetchcert" and
define the hash "fetchcert::fetch"

## Parameters

See the [documentation](https://dodevops.github.io/puppet-fetchcert/doc/index.html).