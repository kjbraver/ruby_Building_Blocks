def stock_picker(stock_prices)
  #validate argument is a array
  unless stock_prices.is_a? Array 
    puts "Wrong argument error: This method requires an array of ints"
    return -1
  end

  #validate stock_prices is an array of ints
  stock_prices.each do |price|
    unless(price.is_a? Integer)
      puts "Wrong argument error: This method requires an array of ints"
      return -2
    end
  end

  #declare variables
  purchase_day = 0
  sell_day = 0
  profit = 0

  #iterate through each possible stock purchase day
  stock_prices.each_with_index do |purchase_price, purchase_index|
    #if we are not on the last day of the purchase cycle, iterate through remaining sale days
    if(purchase_index < stock_prices.size - 1)
      #'drop' prior days in the cycle, including the current purchase day
      stock_prices.drop(purchase_index+1).each_with_index do |sell_price, sell_index|
        current_profit = sell_price - purchase_price
        #compare profits and update tracking variables if current_profit is a greater value
        if(current_profit > profit)
          profit = current_profit
          purchase_day = purchase_index
          #we add purchase_index + 1 to put the sell_day index on the same scale as
          #purchase_day index. Note: the array was shortened with the drop command on line 25
          sell_day = sell_index + purchase_index + 1
        end
      end
    end
  end

  return [purchase_day, sell_day]
end

p stock_picker([17,3,6,9,15,8,6,1,10])