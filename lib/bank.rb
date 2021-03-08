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

  def withdraw(amount)
    raise "Request denied. Not enough money in account." if (@account - amount) < 0
    @account -= amount
  end
end
