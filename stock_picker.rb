def stock_picker(prices)
  best_profit = {profit: 0, day1: 0, day2: 0, price1: 0, price2: 0}
  prices.each_with_index do |fir_price, fir_idx|
    later_prices = prices[fir_idx+1..prices.count]
    later_prices.each_with_index do |sec_price, sec_idx|
      if best_profit[:profit] < (sec_price - fir_price)
        best_profit[:profit] = (sec_price - fir_price)
        best_profit[:day1] = fir_idx
        best_profit[:day2] = fir_idx + sec_idx + 1
        best_profit[:price1] = fir_price
        best_profit[:price2] = sec_price
      end
    end
  end
  puts "You should buy on day #{best_profit[:day1]} ($#{best_profit[:price1]})"\
       " and sell on day #{best_profit[:day2]} ($#{best_profit[:price2]})"\
       " for a profit of $#{best_profit[:profit]} based on these prices:"
  p prices
  [best_profit[:day1], best_profit[:day2]]
end

def random_stocks(days)
  prng = Random.new
  stocks = Array.new
  days.times do |num|
    stocks.push(prng.rand(1..25))
  end
  stocks
end

p stock_picker(random_stocks(10))
