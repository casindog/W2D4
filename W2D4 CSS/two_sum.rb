#two_sum

def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
      if idx1 < idx2
        return true if ele1 + ele2 == target_sum
      end
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr.sort!
  val = 0
  arr.each_with_index do |ele, idx|
    val = target_sum - ele
    
  end
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false