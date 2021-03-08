# frozen_string_literal: true

class Statement
  attr_reader :history

  def initialize
    @history = []
  end

  def transaction_summary
    'No transactions to show'
  end
end
