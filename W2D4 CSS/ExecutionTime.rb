def my_min1(arr)
  min = 0
  arr.each_with_index do |el1,idx1|
    arr.each_with_index do |el2,idx2|
      if el2 > el1
        min = el1 if el1 < min
      else
        min = el2 if el2 < min
      end
    end
  end

  min
end

def my_min2(arr)
  min = arr.first
  arr.each do |el|
    if el < min
      min = el
    end
  end
  min

end

def subsets_rec(arr)
  return [[]] if arr.empty?
  sub = subsets(arr[0...-1])
  last = arr.last
  
  sub + (sub.map{|el| el + [last]})
end

def subsets_iter(arr)
  i = 0
  j = 0
  output = []
  while i < arr.length
    j =  i 
    while j < arr.length
      output << arr[i..j]
    j += 1
    end
  i += 1
  end
  output
end

def lcs(arr)
  subarrs = subsets_iter(arr)
  sum = subarrs.first.sum
    subarrs.each do |ele|
      if ele.sum > sum
        sum = ele.sum
      end
    end
    sum
end

def lcs_better(arr)
  sum = 0
  max_sum = arr.first

    arr.each do |el|
      sum += el
      if max_sum < sum
        max_sum = sum
      end

      if sum < 0
        sum = 0
      end

      if max_sum < 0 && el > max_sum
        max_sum = el
      end
    end

    max_sum

end
 a = [-5, -1, -3]
 b = [2, 3, -6, 7, -6, 7]
 c = [5, 3, -7]

 p lcs_better(a)
 p lcs_better(b)
  p lcs_better(c)
