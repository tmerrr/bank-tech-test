# Bank Account Class
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance      = starting_balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << { date: Time.now, type: 'credit', amount: amount}
  end

  def withdraw(amount)
    raise 'Insufficient Funds Available' if @balance < amount
    @balance -= amount
    @transactions << { date: Time.now, type: 'debit', amount: amount}
  end

  def statement
    puts "date || credit || debit || balance"
  end
end
