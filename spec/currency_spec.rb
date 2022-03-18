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
            expect(Currency.new.money(50)).to eq(:dime=>0, :nickel=>0, :penny=>0, :quarter=>2)
        end
        it "has some for amount" do
            expect(Currency.new.money(41)).to eq(:dime=>1, :nickel=>1, :penny=>1, :quarter=>1)
        end      
        it "has a negative value should give error" do
            expect(Currency.new.money(-10)).to eq("value must be greater than zero")
        end

    end
end