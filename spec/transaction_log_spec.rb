require 'transaction_log'

describe TransactionLog do
  let(:transaction)         { double(:transaction) }
  let(:transaction_class)   { double(:transaction_class, new: transaction) }
  subject(:transaction_log) { described_class.new(transaction_class) }
  describe '#history' do
    context 'when initialized' do
      it 'has an empty array of transactions' do
        expect(transaction_log.history).to be_a(Array)
      end
    end
  end

  describe '#record_transaction' do
    describe 'the correct values are passed into the new Transaction' do
      context 'when no values are passed in' do
        it 'defaults all values to nil' do
          expect(transaction_class).to receive(:new)
            .with(credit: nil, debit: nil, current_balance: nil)
          transaction_log.record_transaction
        end
      end

      context 'when a credit of 10 is passed in' do
        it 'receives credit of 10 with nil for the other values' do
          expect(transaction_class).to receive(:new)
            .with(credit: 10, debit: nil, current_balance: nil)
          transaction_log.record_transaction(credit: 10)
        end
      end

      context 'when a debit of 25 is passed in' do
        it 'receives debit of 25 with nil for the other values' do
          expect(transaction_class).to receive(:new)
            .with(credit: nil, debit: 25, current_balance: nil)
          transaction_log.record_transaction(debit: 25)
        end
      end

      context 'when a current_balance of 50 is passed in' do
        it 'receives current_balance of 50 with nil for the other values' do
          expect(transaction_class).to receive(:new)
            .with(credit: nil, debit: nil, current_balance: 50)
          transaction_log.record_transaction(current_balance: 50)
        end
      end
    end

    it 'adds a transaction to the history' do
      transaction_log.record_transaction(debit: 10)
      expect(transaction_log.history).to include(transaction)
    end
  end
end
