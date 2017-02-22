require 'spec_helper'

describe 'fetchcert::fetch' do

  let(:title) { '/tmp/test.pem' }

  let(:params) {
    {
        :source_host => 'google.com'
    }
  }

  it {
    is_expected.to contain_exec('fetchcert.google.com:443:/tmp/test.pem')
  }

end