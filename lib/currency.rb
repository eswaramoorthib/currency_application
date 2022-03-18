class Currency
  def  money(amount)
      raise "value must be greater than zero" unless amount > 0
        coins = {quarter: 25, dime: 10, nickel: 5, penny: 1}
        hash = {}

        remaining_amount = amount
        coins.each do |key, value|
          count,amt = currency_div(remaining_amount, value)
          hash[key.to_sym] = count
          remaining_amount = amt
        end
        hash
      rescue => error
        error.message
  end
  def currency_div(amount, coin)
    amount.divmod(coin)
  end
end

value1 = Currency.new
p "Enter the amount"
value2 = gets.chomp
p value1.money(value2.to_i) 