require 'transaction'

describe Transaction do
  let(:time) { double(:time, strftime: '05/01/2018') }
  before(:each) do
    allow(Time).to receive(:now).and_return(time)
  end

  describe '#credit' do
    it 'returns the value of the credit' do
      transaction = Transaction.new(credit: 5, balance: 10)
      expect(transaction.credit).to eq(5)
    end
  end

  describe '#debit' do
    it 'returns the value of the debit' do
      transaction = Transaction.new(debit: 5, balance: 10)
      expect(transaction.debit).to eq(5)
    end
  end

  describe '#balance' do
    it 'returns the value of the balance' do
      transaction = Transaction.new(credit: 5, balance: 10)
      expect(transaction.balance).to eq(10)
    end
  end

end
