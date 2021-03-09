# frozen_string_literal: true

# class for Bank account transaction history
class Statement
  attr_reader :transaction_history

  # Error message constants
  NO_TRANSACTIONS_WARNING = 'No transactions to show'

  # statement columns constant
  COLUMN_LABELS = %w[date credit debit balance].freeze

  def initialize
    @transaction_history = []
  end

  def transaction_summary
    return NO_TRANSACTIONS_WARNING if no_transactions?

    transaction_table
  end

  def add_credit(credit, balance)
    current_balance = credit_calculator(credit, balance)
    @transaction_history.push(transaction(credit, '', current_balance))
  end

  def withdraw_debit(debit, balance)
    current_balance = debit_calculator(debit, balance)
    @transaction_history.push(transaction('', debit, current_balance))
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
    [transaction_date, credit, debit, balance]
  end

  def no_transactions?
    @transaction_history.empty?
  end

  def transaction_table
    transaction_table_columns + transaction_table_rows
  end

  def transaction_table_rows
    row = []
    @transaction_history.map do |transaction|
      row.push(transaction.join(' || '))
    end
    row.join("\n")
  end

  def transaction_table_columns
    "#{COLUMN_LABELS.join(' || ')}\n"
  end
end
