require 'pry'
require 'csv'

class Sale

  def initialize

  end

  def input
    print "Input CSV Filename: "
    csv_filename = gets.chomp

    sales_input = CSV.read( "../#{csv_filename}.csv" )
  end
end

Sale.new.input