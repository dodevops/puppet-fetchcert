require 'spec_helper'

# Check basic feature

describe file('/tmp/testpuppet.pem') do
  it { should exist }
  it { should be_file }
  its(:size) { should > 0 }
  its(:content) { should contain 'BEGIN CERTIFICATE'}
end

# Check hiera feature

describe file('/tmp/testhiera.pem') do
  it { should exist }
  it { should be_file }
  its(:size) { should > 0 }
  its(:content) { should contain 'BEGIN CERTIFICATE'}
end
