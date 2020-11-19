require 'pry'

class CashRegister
    attr_reader :items, :discount
    attr_accessor :total

    def initialize(discount = 0)
        total = 0
        @total = total
        @discount = discount
        items = []
        @items = items
    end

    def add_item(title, price, quantity = 1)
        @quantity = quantity
        @total += price * quantity
        counter = 0
        until counter == quantity
            @items << title
            counter += 1
            @last_price = price
        end
    end


    def apply_discount
        original_price = @total
        @total = @total - (@total * @discount / 100.0)
        @total == original_price ? "There is no discount to apply." : "After the discount, the total comes to $#{@total.to_i}."
    end

    def void_last_transaction
        @items.pop
        @total -= (@last_price * @quantity)
        if @items.empty?
            @total = 0.0
        end
    end

end
