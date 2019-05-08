lookup('classes', {merge => unique, default_value => undef}).include

fetchcert::fetch {
  '/tmp/testpuppet.pem':
    source_host => 'google.com',
}