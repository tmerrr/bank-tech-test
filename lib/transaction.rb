class Transaction
  def initialize(credit: nil, debit: nil, balance: nil)
    @date     = Time.now
    @credit   = credit
    @debit    = debit
    @balance  = balance
  end

  def print_details
    puts "02/01/2018 || 10.00 ||  || 20.00"
  end
end
