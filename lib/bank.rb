# frozen_string_literal: true

# Bank class
class Bank
  attr_reader :balance

  # Error message contsants
  WITHDRAWL_ERROR = 'Request denied. Not enough money in account.'

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    withdrawal_checker(amount)
    @balance -= amount
  end

  def statement
    return 'No transactions to show' if @history.empty?
  end

  private #------------------------------

  def withdrawal_checker(withdrawl_amount)
    raise WITHDRAWL_ERROR if negative_balance_checker(withdrawl_amount)
  end

  def negative_balance_checker(withdrawl_amount)
    (@balance - withdrawl_amount).negative?
  end
end
