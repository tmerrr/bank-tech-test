require_relative 'helpers'

# Bank Account Class
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance      = starting_balance.to_f
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    amount = amount.to_f
    @transactions << {
      date: Time.now,
      credit: amount.to_currency,
      debit: nil,
      balance: @balance.to_currency
    }
  end

  def withdraw(amount)
    raise 'Insufficient Funds Available' if @balance < amount
    @balance -= amount
    @transactions << {
      date: Time.now,
      credit: nil,
      debit: amount.to_currency,
      balance: @balance.to_currency
    }
  end

  def statement
    puts "date || credit || debit || balance"
    @transactions.each do |t|
      puts "#{t[:date].strftime("%d/%m/%Y")} || " +
      "#{t[:credit]} || " +
      "#{t[:debit]} || " +
      "#{t[:balance]}"
    end
  end
end
