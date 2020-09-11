# Implement a method #stock_picker that takes in an array of stock prices,
# one for each hypothetical day. It should return a pair of days representing
# the best day to buy and the best day to sell. Days start at 0.

def stock_picker(arr)
  h = {}

  (0...arr.length).each do |subtrahend|
    (subtrahend + 1...arr.length).each do |minuend|
      break if arr[subtrahend] > arr[minuend]

      difference = arr[minuend] - arr[subtrahend]

      h[difference] = subtrahend, minuend
    end
  end
  h.max_by { |k, _v| k }[1]
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
