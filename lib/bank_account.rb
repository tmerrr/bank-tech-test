require_relative 'transaction'

# Bank Account Class
class BankAccount
  attr_reader :balance

  def initialize(starting_balance = 0, transaction_class = Transaction)
    @balance            = starting_balance
    @transaction_class  = transaction_class
    @transactions       = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << @transaction_class.new(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    raise 'Insufficient Funds Available' if @balance < amount
    @balance -= amount
    @transactions << @transaction_class.new(debit: amount, balance: @balance)
  end

  def statement
    puts 'date || credit || debit || balance'
    @transactions.reverse_each(&:print_details)
  end
end
