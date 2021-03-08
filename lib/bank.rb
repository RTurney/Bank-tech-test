# frozen_string_literal: true

require_relative 'statement'
# Bank class
class Bank
  attr_reader :balance

  # Error message contsants
  WITHDRAWL_ERROR = 'Request denied. Not enough money in account.'

  def initialize
    @balance = 0
    @user_statement = Statement.new
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    withdrawal_checker(amount)
    @balance -= amount
  end

  def print_statement
    @user_statement.transaction_summary
  end

  private #------------------------------

  def withdrawal_checker(withdrawl_amount)
    raise WITHDRAWL_ERROR if negative_balance_checker(withdrawl_amount)
  end

  def negative_balance_checker(withdrawl_amount)
    (@balance - withdrawl_amount).negative?
  end
end
