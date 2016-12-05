require 'sale'

RSpec.describe Sale do
  describe '#input' do
    let( :sale ) { Sale.new }
    before do
    end

    it 'return with the number inserted' do
      expect( sale.input( 1, "book", 12.49 ) ).to eq( [
        {
          quantity: 1,
          product: "book",
          price: 12.49
        }
      ] )
    end
  end
end