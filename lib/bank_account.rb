require_relative 'transaction_log'

# Bank Account Class
class BankAccount
  attr_reader :balance

  def initialize(starting_balance = 0, transaction_log_class = TransactionLog)
    @balance          = starting_balance
    @transaction_log  = transaction_log_class.new
  end

  def deposit(amount)
    @balance += amount
    @transaction_log.record_transaction(
      credit: amount,
      current_balance: @balance
    )
  end

  def withdraw(amount)
    raise 'Insufficient Funds Available' if @balance < amount
    @balance -= amount
    @transaction_log.record_transaction(
      debit: amount,
      current_balance: @balance
    )
  end

  def statement
    puts 'date || credit || debit || balance'
    @transaction_log.history.reverse_each(&:print_details)
  end
end
