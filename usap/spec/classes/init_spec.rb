require 'spec_helper'
describe 'usap' do
  context 'with default values for all parameters' do
    it { should contain_class('usap') }
  end
end
