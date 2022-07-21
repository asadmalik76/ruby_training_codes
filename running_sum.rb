
def running_sum(arr)
  size = arr.size()
  res = Array.new(size)
  res[0] = arr[0]
  i = 1
  while size > 1
    res[i] = res[i - 1] + arr[i]
    size -= 1
    i += 1
  end
  puts res.to_s
end
arr = Array[1, 2, 3, 4, 5]
running_sum(arr)
