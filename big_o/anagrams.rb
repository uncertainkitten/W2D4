require 'set'

def first_anagram?(str1,str2)
  perms = Set.new
  str1.chars.permutation do |perm| 
    p perm
    perms.add(perm)
  end
  perms.include?(str2.chars)
end

def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  arr1.each do |char|
    idx = arr2.find_index(char)
    return false if idx.nil?
    arr2.delete_at(idx)
  end
  true
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  counts = Hash.new(0)
  str1.chars.each { |char| counts[char] += 1 }
  str2.chars.each { |char| counts[char] -= 1 }
  counts.values.all?(&:zero?)
end
