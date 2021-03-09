# frozen_string_literal: true

require 'statement'

describe Statement do
  before(:each) do
    @date = Time.new.strftime('%d/%m/%Y')
  end

  describe 'on initialisation' do
    it 'will have an empty array' do
      expect(subject.transaction_history).to eq []
    end
  end

  describe '.add_credit' do
    it 'will add the date, credit amount and balance to the transaction_history' do
      subject.add_credit(100, 0)

      expect(subject.transaction_history[0]).to eq([@date, '100.00', '', '100.00'])
    end
  end

  describe '.withdraw_debit' do
    it 'will add the date, credit amount and balance to the transaction_history' do
      subject.withdraw_debit(10, 20)

      expect(subject.transaction_history[0]).to eq([@date, '', '10.00', '10.00'])
    end
  end

  describe '.transaction_summary' do
    it 'will return "No transactions to show" if transaction_history is empty' do
      expect(subject.transaction_summary).to eq 'No transactions to show'
    end

    it 'will return a statement in a table format' do
      subject.add_credit(100, 0)

      expect(subject.transaction_summary).to eq "date || credit || debit || balance\n#{@date} || 100.00 ||  || 100.00"
    end

    it 'returns all transactions in the correct format' do
      subject.add_credit(100, 0)
      subject.withdraw_debit(20, 100)

      expect(subject.transaction_summary).to eq "date || credit || debit || balance\n#{@date} ||  || 20.00 || 80.00\n#{@date} || 100.00 ||  || 100.00"
    end
  end
end
