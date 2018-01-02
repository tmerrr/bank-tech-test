require 'bank_account'

describe BankAccount do
  describe '#balance' do
    context 'after a new account is created' do
      it 'returns 0' do
        expect(subject.balance).to eq(0)
      end
    end
  end
end
