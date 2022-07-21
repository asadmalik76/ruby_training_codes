
def random_array(size, lower, upper)
  arr = []
  while size.positive?
    arr.push(rand(lower..upper))
    size -= 1
  end
  arr
end

def check_freq(arr)
  freq = {}
  arr.each do |key|
    if freq[key]
      freq[key] += 1
    else
      freq[key] = 1
    end
  end
  puts freq.to_s
end
arr = random_array(10, 0, 10)
check_freq(arr)
