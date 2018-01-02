require 'bank_account'

describe BankAccount do
  let(:transaction) { double(:transaction) }
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  subject(:account) { described_class.new(0, transaction_class) }

  describe '#balance' do
    describe 'used to return the current balance' do
      context 'after a new account is created' do
        it 'returns 0' do
          expect(account.balance).to eq(0)
        end
      end

      context 'when an account is created with 10' do
        it 'returns 10' do
          account = described_class.new(10)
          expect(account.balance).to eq(10)
        end
      end

      context 'when an account is created with 25' do
        it 'returns 25' do
          account = described_class.new(25)
          expect(account.balance).to eq(25)
        end
      end
    end
  end

  describe '#deposit' do
    describe 'can deposit an amount, which is then added to the balance' do
      context 'when a user deposits £10 to an account with 0 balance' do
        it 'updates the balance to 10' do
          expect { account.deposit(10) }
            .to change { account.balance }.by(10)
        end

        it 'creates an instance of Transaction' do
          expect(transaction_class).to receive(:new)
            .with(credit: 10, balance: 10)
          account.deposit(10)
        end
      end

      context 'when a user deposits £20 to an account with 0 balance' do
        it 'updates the balance to 20' do
          expect { account.deposit(20) }
            .to change { account.balance }.by(20)
        end
      end

      context 'when a user deposits £10 to an account with £50 balance' do
        let(:account) { described_class.new(50, transaction_class) }
        it 'updates the balance to 60' do
          account.deposit(10)
          expect(account.balance).to eq(60)
        end

        it 'creates an instance of Transaction' do
          expect(transaction_class).to receive(:new)
            .with(credit: 10, balance: 60)
          account.deposit(10)
        end
      end

      context 'when a user deposits £25 to an account with £75 balance' do
        let(:account) { described_class.new(75, transaction_class) }
        it 'updates the balance to 60' do
          account.deposit(25)
          expect(account.balance).to eq(100)
        end

        it 'creates an instance of Transaction' do
          expect(transaction_class).to receive(:new)
            .with(credit: 25, balance: 100)
          account.deposit(25)
        end
      end
    end
  end

  describe '#withdraw' do
    let(:account) { described_class.new(100, transaction_class) }
    describe 'can withdraw an amount, which is taken away from the balance' do
      context 'when a user withdraws 10 from an account with 100' do
        it 'updates the balance to 90' do
          account.withdraw(10)
          expect(account.balance).to eq(90)
        end

        it 'creates an instance of Transaction' do
          expect(transaction_class).to receive(:new)
            .with(debit: 10, balance: 90)
          account.withdraw(10)
        end
      end

      context 'when a user withdraws 25 from an account with 100' do
        it 'updates the balance to 75' do
          account.withdraw(25)
          expect(account.balance).to eq(75)
        end

        it 'creates an instance of Transaction' do
          expect(transaction_class).to receive(:new)
            .with(debit: 25, balance: 75)
          account.withdraw(25)
        end
      end

      context 'when a user withdraws 70 from an account with 100' do
        it 'updates the balance to 30' do
          account.withdraw(70)
          expect(account.balance).to eq(30)
        end
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
    let(:header) { "date || credit || debit || balance\n" }

    describe 'prints a list of transactions with dates' do
      context 'when there are no transactions' do
        it 'prints just the headers for each column' do
          expect { account.statement }
            .to output(header).to_stdout
        end
      end

      context 'after a user has made a deposit' do
        before(:each) do
          account.deposit(10)
        end

        it 'prints the headers and the details of the deposit' do
          expect(transaction).to receive(:print_details)
          account.statement
        end
      end
    end
  end
end
