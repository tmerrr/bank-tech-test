require_relative 'helpers'

# Extracted a Transaction into its own class
class Transaction
  def initialize(credit: nil, debit: nil, balance: nil)
    @date     = Time.now
    @credit   = credit.to_currency
    @debit    = debit.to_currency
    @balance  = balance.to_currency
  end

  def print_details
    puts "#{@date} || #{@credit} || #{@debit} || #{@balance}"
  end
end
