# frozen_string_literal: true

# class for Bank account transaction history
class Statement
  attr_reader :history

  def initialize
    @history = []
  end

  def transaction_summary
    'No transactions to show'
  end

  def add_credit(credit, balance)
    @history.push(credit_transaction(credit, balance))
  end

  def withdraw_debit(debit, balance)
    @history.push(debit_transaction(debit, balance))
  end

  private #---------------------

  def transaction_date
    Time.new.strftime('%Y/%m/%d')
  end

  def balance_calculator(amount, current_balance)
    current_balance + amount
  end

  def credit_transaction(credit, balance)
    { date: transaction_date, credit: credit, debit: 0, balance: balance_calculator(credit, balance) }
  end

  def debit_transaction(debit, balance)
    { date: transaction_date, credit: 0, debit: debit, balance: balance_calculator(-debit, balance) }
  end
end
