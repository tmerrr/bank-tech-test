require 'bank_account'

describe BankAccount do
  subject(:account) { described_class.new(0) }

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
      end

      context 'when a user deposits £20 to an account with 0 balance' do
        it 'updates the balance to 20' do
          expect { account.deposit(20) }
            .to change { account.balance }.by(20)
        end
      end

      context 'when a user deposits £10 to an account with £50 balance' do
        it 'updates the balance to 60' do
          account = described_class.new(50)
          account.deposit(10)
          expect(account.balance).to eq(60)
        end
      end

      context 'when a user deposits £25 to an account with £75 balance' do
        it 'updates the balance to 60' do
          account = described_class.new(75)
          account.deposit(25)
          expect(account.balance).to eq(100)
        end
      end
    end
  end

  describe '#withdraw' do
    let(:account) { described_class.new(100) }
    describe 'can withdraw an amount, which is taken away from the balance' do
      context 'when a user withdraws 10 from an account with 100' do
        it 'updates the balance to 90' do
          account.withdraw(10)
          expect(account.balance).to eq(90)
        end
      end
    end
  end
end
