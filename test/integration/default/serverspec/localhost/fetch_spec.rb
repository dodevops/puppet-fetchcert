require 'spec_helper'

# Check basic feature

describe 'fetchert' do
  describe file('/tmp/testpuppet.pem') do
    it { is_expected.to exist }
    it { is_expected.to be_file }
    its(:size) { is_expected.to be > 0 }
    its(:content) { is_expected.to contain 'BEGIN CERTIFICATE' }
  end

  # Check hiera feature

  describe file('/tmp/testhiera.pem') do
    it { is_expected.to exist }
    it { is_expected.to be_file }
    its(:size) { is_expected.to be > 0 }
    its(:content) { is_expected.to contain 'BEGIN CERTIFICATE' }
  end
end
