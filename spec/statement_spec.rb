# frozen_string_literal: true

require 'statement'

# class for Bank account transaction history
describe Statement do
  before(:each) do
    @statement = Statement.new
  end

  describe 'on initialisation' do
    it 'will have an empty hash' do
      expect(@statement.history).to eq []
    end
  end

  describe '.add_credit' do

    it 'will add the date, credit amount and balance to the hash' do
      time = Time.new
      date = time.strftime("%Y/%m/%d")
      @statement.add_credit(100, 0)
      expect(@statement.history[0]).to eq({date: date, credit: 100, balance: 100})
    end
  end

  describe '.transaction_summary' do
    it 'will return "No transactions to show" if history is empty' do
      expect(@statement.transaction_summary).to eq 'No transactions to show'
    end
  end
end
