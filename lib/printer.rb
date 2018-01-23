require_relative 'helpers'

class Printer
  def print_headers
    puts 'date || credit || debit || balance'
  end

  def print_transaction(transaction)
    date    = transaction.date
    credit  = '£' + transaction.credit.to_currency if transaction.credit
    debit   = '£' + transaction.debit.to_currency if transaction.debit
    balance = '£' + transaction.balance.to_currency if transaction.balance
    puts "#{date} || #{credit} || #{debit} || #{balance}"
  end
end
