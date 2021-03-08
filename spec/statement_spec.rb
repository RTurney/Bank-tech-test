require 'statement'

describe Statement do

  before(:each) do
    @statement = Statement.new
  end

  describe 'on initialisation' do

    it 'will have an empty hash' do
      expect(@statement.history).to eq({})
    end
  end
end
