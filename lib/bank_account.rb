require_relative 'transaction_log'
require_relative 'balance'

# Bank Account Class
class BankAccount
  def initialize(
    starting_balance      = 0,
    balance_class         = Balance,
    transaction_log_class = TransactionLog
  )
    @balance          = balance_class.new(starting_balance)
    @transaction_log  = transaction_log_class.new
  end

  def current_balance
    @balance.total
  end

  def deposit(amount)
    @balance.add(amount)
    record_transaction(credit: amount)
  end

  def withdraw(amount)
    raise 'Insufficient Funds Available' if current_balance < amount
    @balance.subtract(amount)
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
      balance: current_balance
    )
  end

end
