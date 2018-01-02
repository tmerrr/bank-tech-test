require 'transaction'

describe Transaction do
  describe '#print_details' do
    context 'when the transaction is a £10 deposit' do
      it 'prints the details of the transaction' do
        allow(Time).to receive_messages(new: '02/01/2018')
        transaction = described_class.new(credit: 10, balance: 20)
        expect { transaction.print_details }
          .to output("02/01/2018 || 10.00 ||  || 20.00\n").to_stdout
      end
    end
  end
end
