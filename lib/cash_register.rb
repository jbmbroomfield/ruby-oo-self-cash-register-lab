class CashRegister
    attr_accessor :total, :discount, :items, :prices

    def initialize(discount=0)
        self.total = 0
        self.discount = discount
        self.items = []
        self.prices = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        self.items += [title] * quantity
        self.prices += [[price] * quantity]
    end

    def apply_discount
        return "There is no discount to apply." if self.discount == 0
        self.total = self.total * (100 - self.discount) / 100
        "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        self.items.pop
        self.prices.pop
        self.total = self.prices.flatten.reduce(0, :+)
    end
end