require "currency.rb"

describe Currency do
    context ".money" do
        before do 
            @coins = [25,10,5,1]
        end
        it "has a coins count" do
            expect(@coins.count).to eq(4)
        end
        it "has some for amount" do
            expect(Currency.new.money(50, {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq(:dime=>0, :nickel=>0, :penny=>0, :quarter=>2)
        end
        it "has some for amount" do
            expect(Currency.new.money(41, {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq(:dime=>1, :nickel=>1, :penny=>1, :quarter=>1)
        end      
        it "has a negative value should give error" do
            expect(Currency.new.money(-10, {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq("value should be only numbers")
        end
        it "has a given comparsion error" do
            expect(Currency.new.money("abcd", {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq("value should be only numbers")
        end
        it "has a given value is zero" do
            expect(Currency.new.money(0, {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq("value should be only numbers")
        end
        it "has a given value is nil" do
            expect(Currency.new.money(nil, {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq("value should be only numbers")
        end
        it "has a coin value is nil" do
            expect(Currency.new.money(nil, {quarter: 25, dime: 10, nickel: 5, penny: nil})).to eq("value should be numbers, no other type of values")
        end
        it "has a coin value is string" do
            expect(Currency.new.money(nil, {quarter: 25, dime: 10, nickel: 5, penny: "abcd"})).to eq("value should be numbers, no other type of values")
        end
        it "has a coin value is zero" do
            expect(Currency.new.money(nil, {quarter: 25, dime: 10, nickel: 5, penny: 0})).to eq("value should be numbers, no other type of values")
        end
    end
end