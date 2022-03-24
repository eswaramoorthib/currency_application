require "currency.rb"

describe Currency do
    context ".money" do
        before do 
            @coins = [25,10,5,1]
            @currency = Currency.new
        end
        it "has a coins count" do
            expect(@coins.count).to eq(4)
        end
        it "has a coin value for amount" do
            expect(@currency.money(50, {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq(:dime=>0, :nickel=>0, :penny=>0, :quarter=>2)
        end      
        it "has a negative value should give error" do
            expect(@currency.money(-10, {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq("value should be only numbers")
        end
        it "has a coin value is string" do
            expect(@currency.money("abcd", {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq("value should be only numbers")
        end
        it "has a coin value is zero" do
            expect(@currency.money(0, {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq("value should be only numbers")
        end
        it "has a coin value is nil" do
            expect(@currency.money(nil, {quarter: 25, dime: 10, nickel: 5, penny: 1})).to eq("value should be only numbers")
        end
        it "has a country money value is nil" do
            expect(@currency.money(100, {quarter: 25, dime: 10, nickel: 5, penny: nil})).to eq("value should be numbers, no other type of values")
        end
        it "has a country money value is string" do
            expect(@currency.money(100, {quarter: 25, dime: 10, nickel: 5, penny: "abcd"})).to eq("value should be numbers, no other type of values")
        end
        it "has a country money value is zero" do
            expect(@currency.money(100, {quarter: 25, dime: 10, nickel: 5, penny: 0})).to eq("value should be numbers, no other type of values")
        end
        it "has a coin value for one country" do
            expect(@currency.money(100, {quarter: 25})).to eq({:quarter=>4})
        end
        it "has a coin value for two country" do
            expect(@currency.money(100, {quarter: 25, dime: 10})).to eq({:dime=>0, :quarter=>4})
        end
        it "has a coin value for three country" do
            expect(@currency.money(90, {quarter: 25, dime: 10, Nickel: 5})).to eq({:Nickel=>1, :dime=>1, :quarter=>3})
        end
        it "has a coin value for country values" do
            expect(@currency.money(2, {quarter: 25, dime: 10, Nickel: 5, Penny: 15, US: 2})).to eq({:Nickel=>0, :Penny=>0, :US=>1, :dime=>0, :quarter=>0})
        end
        it "has a coin value for country" do
            expect(@currency.money(100, {quarter: 0})).to eq("value should be numbers, no other type of values")
        end
        it "has a coin value and country is zero" do
            expect(@currency.money(0, {quarter: 0})).to eq("value should be numbers, no other type of values")
        end
        it "has a coin value is less than country value" do
            expect(@currency.money(1, {quarter: 25})).to eq({:quarter=>0})
        end
        it "has a coin value and country value are zero" do
            expect(@currency.money(0, {quarter: 0, dime: 0, Nickel: 0, Penny: 0, US: 0})).to eq("value should be numbers, no other type of values")
        end
        it "has a coin value is float" do
            expect(@currency.money(1.0, {quarter: 1, dime: 0, Nickel: 0, Penny: 0, US: 0})).to eq("value should be numbers, no other type of values")
        end
        it "has a coin value and country value are empty" do
            expect(@a.money(10, { })).to eq({})
        end
        it "has a coin value and country value are zero" do
            expect(@a.money(10, {quarter: -25, dime: 0, Nickel: 0, Penny: 0, US: 0})).to eq("value should be numbers, no other type of values")
        end
        
    end
end