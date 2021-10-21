# @param {Integer[]} nums
# @return {Integer}
def find_min(nums, minimum = Float::INFINITY, start_index = nil, end_index = nil)
  start_index = 0 unless start_index
  end_index = nums.length - 1 unless end_index
  
  return minimum if start_index > end_index
  
  current_index = (start_index + end_index) / 2
  current_number = nums[current_index]
  minimum = current_number if current_number < minimum
  
  if current_number < nums[start_index]
      return find_min(nums, minimum, start_index, current_index - 1)
  else
      minimum = nums[start_index] if nums[start_index] < minimum
      return find_min(nums, minimum, current_index + 1, end_index)
  end
  
  minimum
end