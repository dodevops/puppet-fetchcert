hiera_include('classes', undef)

fetchcert::fetch {
  '/tmp/testpuppet.pem':
    source_host => 'google.com',
}