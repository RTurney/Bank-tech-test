# frozen_string_literal: true

require 'bank'

describe Bank do
  describe 'on initialisation' do
    it 'has an empty account' do
      expect(subject.balance).to eq 0
    end
  end

  describe '.deposit' do
    it 'allows users to add money to their account' do
      subject.deposit(100)
      expect(subject.balance).to eq 100
    end

    it "won't allow users to input negative values" do
      expect { subject.deposit(-100) }.to raise_error 'Cannot input negative values.'
    end

    it 'will not allow any other input types' do
      expect { subject.deposit("100") }.to raise_error 'Request denied. Please enter your amount as an integer.'
    end
  end

  describe '.withdraw' do
    it 'allows users to withdraw money from their account' do
      subject.deposit(10)
      subject.withdraw(5)
      expect(subject.balance).to eq 5
    end

    it "won't allow users to withdraw more than their account" do
      expect { subject.withdraw(100) }.to raise_error 'Request denied. Not enough money in account.'
    end

    it 'will not allow users to withdraw a negative amount' do
      expect {subject.withdraw(-100) }.to raise_error 'Cannot input negative values.'
    end
  end

  describe '.statement' do
    it 'returns "No transactions to show" to output if there has been no transations' do
      allow_any_instance_of(Statement).to receive(:transaction_summary).and_return('No transactions to show')

      expect { subject.print_statement }.to output("No transactions to show\n").to_stdout
    end
  end
end
