require 'bank_account'

describe BankAccount do
  subject(:account) { described_class.new(0) }

  describe '#balance' do
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
