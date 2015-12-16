require 'spec_helper'
describe 'sar' do

  context 'with defaults for all parameters' do
    it { should contain_class('sar') }
  end
end
