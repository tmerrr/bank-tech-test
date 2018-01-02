require_relative 'helpers'

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
