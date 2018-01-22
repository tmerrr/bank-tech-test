require_relative 'transaction'

class TransactionLog
  attr_reader :history

  def initialize(transaction_class = Transaction)
    @history = []
    @transaction_class = transaction_class
  end

  def record_transaction(credit: nil, debit: nil, current_balance: nil)
    @history << @transaction_class.new(
      credit: credit,
      debit: debit,
      current_balance: current_balance
    )
  end
end
