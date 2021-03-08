# frozen_string_literal: true

# class for Bank account transaction history
class Statement
  attr_reader :history

  #Error message constants
  NO_TRANSACTIONS_WARNING = 'No transactions to show'

  # statement columns constant
  COLUMN_LABELS = ['date', 'credit', 'debit', 'balance']
  def initialize
    @history = []
  end

  def transaction_summary
    return NO_TRANSACTIONS_WARNING if no_transactions
    COLUMN_LABELS.join(' || ') + "\n" + transaction_table
  end

  def add_credit(credit, balance)
    current_balance = credit_calculator(credit, balance)
    @history.push(transaction(credit, 0,  current_balance))
  end

  def withdraw_debit(debit, balance)
    current_balance = debit_calculator(debit, balance)
    @history.push(transaction(0, debit, current_balance))
  end

  private #---------------------

  def transaction_date
    Time.new.strftime('%Y/%m/%d')
  end

  def credit_calculator(amount, current_balance)
    current_balance + amount
  end

  def debit_calculator(amount, current_balance)
    current_balance - amount
  end

  def transaction(credit, debit, balance)
    { date: transaction_date, credit: credit, debit: debit, balance: balance }
  end

  def no_transactions
    @history.empty?
  end

  def transaction_table
    line = []
    @history.map do |transaction|
      transaction.each do |key, value|
        line.push(value)
      end
    end
    return line.join(' || ')
  end
end
