class Currency
  def  money(amount, coins)
      raise "value must be greater than zero" unless amount > 0
        # coins = {quarter: 25, dime: 10, nickel: 5, penny: 1}
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

p Currency.new.money(444, {quarter: 25, dime: 10, nickel: 5, penny: 1})
 