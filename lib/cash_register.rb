require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_item
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity=1)
        @total += price * quantity
        @last_item = price * quantity
        quantity.times do
            @items << item
        end
    end

    def apply_discount
        if @discount != 0
            @total -= (@total * (@discount / 100.to_f))
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_item
    end
end