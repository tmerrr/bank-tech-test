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

  # describe '#print_details' do
  #   context 'when the transaction is a £10 deposit and balance is £20' do
  #     it 'prints the details of the transaction' do
  #       allow(time).to receive(:strftime).and_return('02/01/2018')
  #       transaction = described_class.new(credit: 10, balance: 20)
  #       expect { transaction.print_details }
  #         .to output("02/01/2018 || 10.00 ||  || 20.00\n").to_stdout
  #     end
  #   end
  #
  #   context 'when the transaction is a £30 deposit and balance is £50' do
  #     it 'prints the details of the transaction' do
  #       allow(time).to receive(:strftime).and_return('05/01/2018')
  #       transaction = described_class.new(credit: 30, balance: 50)
  #       expect { transaction.print_details }
  #         .to output("05/01/2018 || 30.00 ||  || 50.00\n").to_stdout
  #     end
  #   end
  #
  #   context 'when the transaction is a £25 withdrawal and balance is £65.50' do
  #     it 'prints the details of the transaction' do
  #       allow(time).to receive(:strftime).and_return('22/08/2017')
  #       transaction = described_class.new(debit: 25, balance: 65.5)
  #       expect { transaction.print_details }
  #         .to output("22/08/2017 ||  || 25.00 || 65.50\n").to_stdout
  #     end
  #   end
  #
  #   context 'when the transaction is £65.23 withdrawal and balance is £4.77' do
  #     it 'prints the details of the transaction' do
  #       allow(time).to receive(:strftime).and_return('12/10/2017')
  #       transaction = described_class.new(debit: 65.23, balance: 4.77)
  #       expect { transaction.print_details }
  #         .to output("12/10/2017 ||  || 65.23 || 4.77\n").to_stdout
  #     end
  #   end
  # end
end
