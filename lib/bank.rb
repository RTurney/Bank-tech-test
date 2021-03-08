# frozen_string_literal: true

# Bank class
class Bank
  attr_reader :account

  # Error message contsants
  WITHDRAWL_ERROR = 'Request denied. Not enough money in account.'

  def initialize
    @account = 0
  end

  def deposit(amount)
    @account += amount
  end

  def withdraw(amount)
    withdrawal_checker(amount)
    @account -= amount
  end

  private #------------------------------

  def withdrawal_checker(withdrawl_amount)
    raise WITHDRAWL_ERROR if negative_amount_checker(withdrawl_amount)
  end

  def negative_amount_checker(withdrawl_amount)
    (@account - withdrawl_amount).negative?
  end
end
