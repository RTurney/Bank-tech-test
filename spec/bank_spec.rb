# frozen_string_literal: true

require 'bank'

describe Bank do
  before(:each) do
    @bank = Bank.new
  end

  describe 'on initialisation' do
    it 'has an empty account' do
      expect(@bank.balance).to eq 0
    end
  end

  describe '.deposit' do
    it 'allows users to add money to their account' do
      @bank.deposit(100)
      expect(@bank.balance).to eq 100
    end
  end

  describe '.withdraw' do
    it 'allows users to withdraw money from their account' do
      @bank.deposit(10)
      @bank.withdraw(5)
      expect(@bank.balance).to eq 5
    end

    it "won't allow users to withdraw more than their account" do
      expect { @bank.withdraw(100) }.to raise_error 'Request denied. Not enough money in account.'
    end
  end
end
