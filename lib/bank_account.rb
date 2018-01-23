require_relative 'transaction_log'
require_relative 'balance'
require_relative 'printer'

# Bank Account Class
class BankAccount
  def initialize(
    starting_balance      = 0,
    balance_class         = Balance,
    transaction_log_class = TransactionLog,
    printer_class         = Printer
  )
    @balance          = balance_class.new(starting_balance)
    @transaction_log  = transaction_log_class.new
    @printer          = printer_class.new
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
    @printer.print_headers
    @transaction_log.history.reverse_each { |t| @printer.print_transaction(t) }
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
