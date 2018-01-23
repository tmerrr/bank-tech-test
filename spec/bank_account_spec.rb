require 'bank_account'

describe BankAccount do
  let(:transaction) { double(:transaction) }
  let(:transaction_log) {
    double(:transaction_log, record_transaction: transaction)
  }
  let(:transaction_log_class) {
    double(:transaction_log_class, new: transaction_log)
  }

  let(:balance)       { double(:balance, total: 100) }
  let(:balance_class) { double(:balance_class, new: balance) }

  let(:printer)       { double(:printer) }
  let(:printer_class) { double(:printer_class, new: printer) }

  subject(:account) {
    described_class.new(
      0,
      balance_class,
      transaction_log_class,
      printer_class
    )
  }

  describe 'starting values / properties' do
    context 'when passed initialized with a value of 10' do
      it 'passes 10 into the new instance of Balance' do
        expect(balance_class)
          .to receive(:new).with(10)
        described_class.new(
          10,
          balance_class,
          transaction_log_class,
          printer_class
        )
      end
    end

    context 'when passed initialized with a value of 25' do
      it 'passes 25 into the new instance of Balance' do
        expect(balance_class)
          .to receive(:new).with(25)
        described_class.new(
          25,
          balance_class,
          transaction_log_class,
          printer_class
        )
      end
    end

    context 'when initialized' do
      it 'instantiates a new TransactionLog' do
        expect(transaction_log_class)
          .to receive(:new)
        described_class.new(
          25,
          balance_class,
          transaction_log_class,
          printer_class
        )
      end

      it 'instantiates a new Printer' do
        expect(printer_class)
          .to receive(:new)
        described_class.new(
          25,
          balance_class,
          transaction_log_class,
          printer_class
        )
      end
    end
  end

  describe '#current_balance' do
    it 'looks at the total of the Balance class' do
      expect(balance).to receive(:total)
      account.current_balance
    end
  end

  describe '#deposit' do
    before(:each) do
      allow(balance).to receive(:add)
    end
    it 'calls the #add method on the balance with a value of 10' do
      expect(balance).to receive(:add).with(10)
      account.deposit(10)
    end

    it 'the TransactionLog records the transaction' do
      allow(balance).to receive(:total).and_return(10)
      expect(transaction_log).to receive(:record_transaction)
        .with(credit: 10, debit: nil, balance: 10)
      account.deposit(10)
    end
  end

  describe '#withdraw' do
    let(:account) { described_class.new(100, balance_class, transaction_log_class) }
    context 'when a user withdraws 10 from an account with 100' do
      it 'calls the subtract method on the Balance, with a value of 10' do
        expect(balance).to receive(:subtract).with(10)
        account.withdraw(10)
      end

      it 'creates an instance of Transaction' do
        allow(balance).to receive_messages(subtract: nil, total: 90)
        expect(transaction_log).to receive(:record_transaction)
          .with(credit: nil, debit: 10, balance: 90)
        account.withdraw(10)
      end
    end

    context 'if a user withdraws an amount higher than the current balance' do
      it 'throws an error' do
        expect { account.withdraw(101) }
          .to raise_error 'Insufficient Funds Available'
      end
    end
  end

  describe '#statement' do
    it 'calls #print_headers on the printer' do
      allow(transaction_log).to receive(:history).and_return([])
      allow(printer).to receive(:print_transaction)
      expect(printer).to receive(:print_headers)
      account.statement
    end

    context 'when there is 1 transaction in the transaction log' do
      it 'calls #print_transaction on the transaction' do
        allow(printer).to receive(:print_headers)
        allow(transaction_log).to receive(:history).and_return([transaction])
        expect(printer).to receive(:print_transaction).with(transaction).once
        account.statement
      end
    end

    context 'when there is 1 transaction in the transaction log' do
      it 'calls #print_transaction on the transaction' do
        allow(printer).to receive(:print_headers)
        allow(transaction_log).to receive(:history).and_return([transaction, transaction])
        expect(printer).to receive(:print_transaction).with(transaction).twice
        account.statement
      end
    end
  end
end
