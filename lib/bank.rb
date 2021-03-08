# frozen_string_literal: true

# Bank class
class Bank
  attr_reader :account

  def initialize
    @account = 0
  end

  def deposit(amount)
    @account += amount
  end
end
