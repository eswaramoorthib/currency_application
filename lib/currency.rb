class Currency
  def  money(amount, coins)
    begin
       raise "value should be only numbers" unless amount.to_i > 0               
        hash = {}

        remaining_amount = amount
        coins.each do |key, value|
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

p Currency.new.money(100, {quarter: 25, dime: 10, nickel: 5, penny: 1})
 