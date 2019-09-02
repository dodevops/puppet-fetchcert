require 'spec_helper'

describe 'fetchcert::fetch' do
  let(:title) { '/tmp/test.pem' }

  let(:params) do
    {
      source_host: 'google.com',
    }
  end

  context 'on Debian/amd64' do
    let(:facts) do
      {
        osfamily: 'Debian',
        operatingsystem: 'Debian',
        os: {
          family: 'Debian',
        },
        architecture: 'amd64',
      }
    end

    it do
      is_expected.to compile
      is_expected.to contain_exec('fetchcert.google.com:443:/tmp/test.pem')
      is_expected.to contain_package('openssl')
    end
  end

  context 'on Ubuntu/amd64' do
    let(:facts) do
      {
        osfamily: 'Debian',
        operatingsystem: 'Ubuntu',
        os: {
          family: 'Debian',
        },
        architecture: 'amd64',
      }
    end

    it do
      is_expected.to compile
      is_expected.to contain_exec('fetchcert.google.com:443:/tmp/test.pem')
      is_expected.to contain_package('openssl')
    end
  end

  context 'on CentOs' do
    let(:facts) do
      {
        osfamily: 'RedHat',
        operatingsystem: 'CentOS',
        os: {
          family: 'RedHat',
        },
      }
    end

    it do
      is_expected.to compile
      is_expected.to contain_exec('fetchcert.google.com:443:/tmp/test.pem')
      is_expected.to contain_package('openssl')
    end
  end

  context 'without manage_package' do
    let(:facts) do
      {
        osfamily: 'RedHat',
        operatingsystem: 'CentOS',
        os: {
          family: 'RedHat',
        },
      }
    end

    let(:params) do
      super().merge(manage_package: false)
    end

    it do
      is_expected.to compile
      is_expected.to contain_exec('fetchcert.google.com:443:/tmp/test.pem')
      is_expected.not_to contain_package('openssl')
    end
  end
end
