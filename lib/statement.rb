# frozen_string_literal: true

class Statement
  attr_reader :history

  def initialize
    @history = []
  end

  def transaction_summary
    'No transactions to show'
  end

  def add_credit(credit, balance)
    @history.push({date: Time.new.strftime("%Y/%m/%d"), credit: credit, balance: balance + credit})
  end
end
