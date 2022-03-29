class Currency
  def initialize(denomination = {quarter: 25, dime: 10, nickel: 5, penny: true})
    @denomination = denomination
  end
  
  def money(amount)
    begin
       raise "Value should be only numbers" unless amount.to_i > 0 
       raise "The denomination value should be numberic type" unless @denomination.values.map(&:to_s).map(&:to_i).all?{|a| a > 0}      
        hash = {}

        remaining_amount = amount
        @denomination.each do |key, value|
          count,amt = remaining_amount.divmod(value)
          hash[key.to_sym] = count
          remaining_amount = amt
        end
        hash
      rescue => error
        error.message
    end
  end

end

p Currency.new.money(50) 
