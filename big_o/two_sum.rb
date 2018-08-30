require 'set'

def bad_two_sum?(arr, target)
  arr.each_with_index do |el1,idx|
    arr[idx+1..-1].each do |el2|
      return true if el1 + el2 == target
    end
  end
  false
end

#complexity of bad_two_sum? is O(n^2)

def okay_two_sum?(arr,target)
  arr = arr.sort
  arr.each_with_index do |el, idx|
    return true if (arr[0...idx] + arr[idx+1..-1]).bsearch {|mid| (target - el) <=> mid}
  end
  false
end

def two_sum?(arr, target)
  seen_nums = Set.new
  arr.each do |el|
    return true if seen_nums.include?(target - el)
    seen_nums.add(el)
  end
  false
end
