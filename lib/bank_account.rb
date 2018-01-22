require_relative 'transaction_log'

# Bank Account Class
class BankAccount
  attr_reader :balance

  def initialize(
    starting_balance = 0,
    transaction_log_class = TransactionLog
  )
    @balance          = starting_balance
    @transaction_log  = transaction_log_class.new
  end

  def deposit(amount)
    @balance += amount
    record_transaction(credit: amount)
  end

  def withdraw(amount)
    raise 'Insufficient Funds Available' if @balance < amount
    @balance -= amount
    record_transaction(debit: amount)
  end

  def statement
    puts 'date || credit || debit || balance'
    @transaction_log.history.reverse_each(&:print_details)
  end

  private
  def record_transaction(credit: nil, debit: nil)
    @transaction_log.record_transaction(
      credit: credit,
      debit: debit,
      current_balance: @balance
    )
  end

end
