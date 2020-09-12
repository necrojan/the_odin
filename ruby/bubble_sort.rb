# Build a method #bubble_sort that takes an array and returns a sorted array. 
# It must use the bubble sort methodology (using #sort would be pretty pointless
# , wouldn’t it?).

def bubble_sort(arr)
  sorted = false
  
  until sorted
    sorted = true

    (0...arr.length - 1).each do |idx|
      if arr[idx] > arr[idx + 1] 
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        sorted = false
      end
    end
  end
  arr
end

p bubble_sort([4,3,78,2,0,2])