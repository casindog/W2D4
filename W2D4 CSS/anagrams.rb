require "byebug"
def first_anagram?(str1, str2)
  arr1 = str1.split("")
  anagrams = permutations(arr1).map {|el| el.join}

  anagrams.include?(str2)


end

def permutations(arr)
  # base case
  return [arr] if arr.length <= 1
  # debugger
  #  arr.first + permutations(arr[1..-1])
  # byebug
  perms = []
  arr.each_with_index do |ele, idx|
    others = arr[0...idx] + arr[idx+1..-1]
    perms += permutations(others).map {|perm| [ele].concat(perm)}
  end
  perms
end

def second_anagram?(str1,str2)
  str1.each_char.with_index do |char, idx1|
    if str2.include?(char)
      idx2 = str2.index(char)
      str2.slice!(idx2)
    else
      return false
    end
  end
  str2.empty?
end

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2)
  h = Hash.new(0)
  str1.each_char {|el| h[el] += 1}
  str2.each_char {|el| h[el] -= 1}
  h.values.all? {|el| el == 0}
end

# a = [1, 2, 3]
# b = ["g", "i", "z", "m", "o"]
# p permutations(b)

p fourth_anagram?("gizmo","lives")
p fourth_anagram?("elvis","lives")