require_relative 'helpers'

# Extracted a Transaction into its own class
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit: nil, debit: nil, balance: nil)
    @date     = Time.now.strftime('%d/%m/%Y')
    @credit   = credit
    @debit    = debit
    @balance  = balance
  end

  def print_details
    puts "#{@date} || #{@credit} || #{@debit} || #{@balance}"
  end
end
