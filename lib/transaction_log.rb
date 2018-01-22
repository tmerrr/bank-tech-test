require_relative 'transaction'

class TransactionLog
  attr_reader :history

  def initialize(transaction_class = Transaction)
    @history = []
    @transaction_class = transaction_class
  end

  def record_transaction(
    credit: nil,
    debit: nil,
    balance: nil
  )
    @history << @transaction_class.new(
      credit: credit,
      debit: debit,
      balance: balance
    )
  end
end
