require "currency.rb"

describe Currency do
    context ".money" do
        before do 
            @currency = Currency.new
            @denomination = {quarter: 25, dime: 10, nickel: 5, penny: 1}
        end
        
        it "has a coin value for amount" do
            expect(@currency.money(50)).to eq("value should be numberic type")
        end      
        it "has a coin value is negative value" do
            expect(@currency.money(-10)).to eq("value should be numberic type")
        end
        it "has a coin value is string" do
            expect(@currency.money("abcd")).to eq("value should be numberic type")
        end
        it "has a coin value is zero" do
            expect(@currency.money(0)).to eq("value should be numberic type")
        end
        it "has a coin value is nil" do
            expect(@currency.money(nil)).to eq("value should be numberic type")
        end
        it "has a country money value is string" do
            expect(@denomination.values).to eq([25, 10, 5, 1])
        end
        it "has a first country value" do
            @value = @denomination.values.first
            expect(100.divmod(@value)).to eq([4,0])
        end
        it "has a last country value" do
            @value = @denomination.values.last
            expect(100.divmod(@value)).to eq([100,0])
        end
        it "has a country value is nil" do
            @denomination = {quarter: nil, dime: 10, nickel: 5, penny: 1}
            expect(@denomination.values.map(&:to_s).map(&:to_i).all?{|a| a > 0}).to eq(false)
        end
        it "has a country value is string" do
            @denomination = {quarter: "abc", dime: 10, nickel: 5, penny: 1}
            expect(@denomination.values.map(&:to_s).map(&:to_i).all?{|a| a > 0}).to eq(false)
        end
        it "has a country value is zero" do
            @denomination = {quarter: 0, dime: 10, nickel: 5, penny: 1}
            expect(@denomination.values.map(&:to_s).map(&:to_i).all?{|a| a > 0}).to eq(false)
        end
        it "has a country value is negative value" do
            @denomination = {quarter: -1, dime: 10, nickel: 5, penny: 1}
            expect(@denomination.values.map(&:to_s).map(&:to_i).all?{|a| a > 0}).to eq(false)
        end
        it "has a country value is negative value" do
            @denomination = {quarter: -1, dime: 10, nickel: 5, penny: false}
            expect(@denomination.values.map(&:to_s).map(&:to_i).all?{|a| a > 0}).to eq(false)
        end
        it "has a country value is negative value" do
            @denomination = {quarter: -1, dime: 10, nickel: 5, penny: true}
            expect(@denomination.values.map(&:to_s).map(&:to_i).all?{|a| a > 0}).to eq(false)
        end
        it "has a country value is negative value" do
            @denomination = {quarter: false, dime: true}
            expect(@denomination.values.map(&:to_s).map(&:to_i).all?{|a| a > 0}).to eq(false)
        end
        it "has a last country value" do
            @value = @denomination.values[2]
            expect(100.divmod(@value)).to eq([20,0])
        end

    end
end