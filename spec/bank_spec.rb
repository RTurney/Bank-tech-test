require 'bank'

describe Bank do

  before(:each) do
    @bank = Bank.new
  end

  describe 'on initialisation' do
    
    it 'has an empty account' do
      expect(@bank.account).to eq 0
    end
  end
end
