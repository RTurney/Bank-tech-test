# frozen_string_literal: true

require_relative 'statement'
# Bank class
class Bank
  attr_reader :balance

  # Error message contsants
  NEGATIVE_BALANCE_ERROR = 'Request denied. Not enough money in account.'
  NEGATIVE_INPUT_ERROR = 'Cannot input negative values.'
  INCORRECT_INPUT_ERROR = 'Request denied. Please enter your amount as an integer.'


  def initialize
    @balance = 0
    @user_statement = Statement.new
  end

  def deposit(amount)
    input_checker(amount)

    @user_statement.add_credit(amount, @balance)
    @balance += amount
  end

  def withdraw(amount)
    input_checker(amount)
    withdrawal_checker(amount)

    @user_statement.withdraw_debit(amount, @balance)
    @balance -= amount
  end

  def print_statement
    puts @user_statement.transaction_summary
  end

  private #------------------------------

  def input_checker(input)
    input_type_checker(input)
    negative_input_checker(input)
  end


  def withdrawal_checker(withdrawl_amount)
    raise NEGATIVE_BALANCE_ERROR if negative_balance_checker(withdrawl_amount)
  end

  def negative_input_checker(input_amount)
    raise NEGATIVE_INPUT_ERROR if input_amount.negative?
  end

  def negative_balance_checker(withdrawl_amount)
    (@balance - withdrawl_amount).negative?
  end

  def input_type_checker(input)
    raise INCORRECT_INPUT_ERROR unless input.is_a? Integer
  end
end
