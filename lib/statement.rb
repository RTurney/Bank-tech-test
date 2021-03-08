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
    @history.push(transaction(credit, 0, balance))
  end

  private #---------------------

  def transaction_date
    Time.new.strftime('%Y/%m/%d')
  end

  def balance_calculator(amount, current_balance)
    current_balance + amount
  end

  def transaction(credit, debit, balance)
    { date: transaction_date, credit: credit, debit: debit, balance: balance_calculator(credit, balance) }
  end
end
