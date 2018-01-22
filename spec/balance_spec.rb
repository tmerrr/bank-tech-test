require 'balance'

describe Balance do
  subject(:balance) { described_class.new }

  describe '#total' do
    it 'defaults to 0' do
      expect(balance.total).to eq(0)
    end

    context 'when passed a value of 10' do
      it 'sets the balance to 10' do
        balance = described_class.new(10)
        expect(balance.total).to eq(10)
      end
    end
  end

  describe '#add' do
    context 'when adding 10 to start balance of 0' do
      it 'the balance increases by 10' do
        expect { balance.add(10) }
          .to change { balance.total }.by(10)
      end
    end

    context 'when adding 20 to start balance of 10' do
      it 'the balance increases by 10' do
        balance = described_class.new(10)
        expect { balance.add(10) }
          .to change { balance.total }.by(10)
      end
    end
  end
end
