def stock_picker(stock_prices_per_day)
  stock_prices_reversed = stock_prices_per_day.reverse
  profit = 0
  best_selling_day = nil
  best_buying_day = nil
  stock_prices_reversed.each do |stock_price|
    stock_prices_reversed.each do |second_stock_price|
      next if stock_prices_reversed.index(second_stock_price) < stock_prices_reversed.index(stock_price)
      new_profit = stock_price - second_stock_price
      if new_profit > profit
        profit = new_profit
        best_selling_day = stock_prices_per_day.index(stock_price)
        best_buying_day = stock_prices_per_day.index(second_stock_price)
      end
    end
  end
  best_days = Array.new([best_buying_day, best_selling_day])
  if best_days.compact.size == 0
    "There is no possible profit on given days."
  else
    "#{best_days} for a profit of $#{stock_prices_per_day.at(best_days[1])} - $#{stock_prices_per_day.at(best_days[0])} = $#{profit}"
  end
end

puts stock_picker([17,3,6,9,15,8,6,1,10])