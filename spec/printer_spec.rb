require 'printer'

describe Printer do
  subject(:printer) { described_class.new }
  let(:transaction) { double(:transaction, date: '05/01/2018') }

  describe '#print_headers' do
    it 'prints the header for a statement' do
      header = "date || credit || debit || balance\n"
      expect { printer.print_headers }
        .to output(header).to_stdout
    end
  end

  describe '#print_transaction' do
    context 'when the transaction has credit of 5, no debit, balance of 10' do
      it 'returns "05/01/2018 || £5.00 ||  || £10.00"' do
        allow(transaction).to receive_messages(
          credit:   5,
          debit:    nil,
          balance:  10
        )
        expected_string = "05/01/2018 || £5.00 ||  || £10.00\n"
        expect { printer.print_transaction(transaction) }
          .to output(expected_string).to_stdout
      end
    end

    context 'when the transaction has no credit, debit of 5, balance of 115' do
      it 'returns "05/01/2018 || £5.00 ||  || £10.00"' do
        allow(transaction).to receive_messages(
          credit:   nil,
          debit:    5,
          balance:  115
        )
        expected_string = "05/01/2018 ||  || £5.00 || £115.00\n"
        expect { printer.print_transaction(transaction) }
          .to output(expected_string).to_stdout
      end
    end
  end
end
