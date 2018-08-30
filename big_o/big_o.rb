def really_crappy_my_min(arr)
  arr.each do |el1|
    return el1 if arr.all? { |el2| el2 >= el1 }
  end
  nil
end

def less_crappy_my_min(arr)
  min = arr[0]
  arr.each do |el|
    min = el if el < min
  end
  min
end

def crappy_largest_contiguous_subsum(arr)
  subarrays = []
  arr.each_with_index do |el1, idx1|
    subarray = [el1]
    arr.each_with_index do |el2, idx2|
      if idx2 > idx1
        subarray += [el2]
        subarrays << subarray
      end
    end
  end
  subarrays.max_by {|subarray| subarray.sum}.sum
end

def good_largest_contiguous_subsum(arr)
  best_sum = arr[0]
  current_sum = 0
  
  arr.each do |el|
    current_sum += el
    best_sum = current_sum if current_sum > best_sum
    current_sum = 0 if current_sum < 0
  end
  
  best_sum
end
