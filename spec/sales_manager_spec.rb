require 'sales_manager'

RSpec.describe SalesManager do
  describe '#input' do
    let( :sale ) { SalesManager.new }

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

  fdescribe '#output' do
    let( :sale ) { SalesManager.new }
    before { sale.input( 1, "Camera", 12.49 ) }

    it 'return with calculated sales tax' do
      binding.pry
    end
  end
end