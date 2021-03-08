# frozen_string_literal: true

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

  describe '.deposit' do
    it 'allows users to add money to their account' do
      @bank.deposit(100)
      expect(@bank.account).to eq 100
    end
  end
end
