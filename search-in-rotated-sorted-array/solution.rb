# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target, start_index = nil, end_index = nil)
  return -1 if nums.length == 0
  
  start_index = 0 unless start_index
  end_index = nums.length - 1 unless end_index
  
  return - 1 if start_index > end_index
  
  current_index = (start_index + end_index) / 2
  current_number = nums[current_index]
  
  return current_index if current_number == target

  if target > current_number
      if nums[start_index] > current_number && nums[end_index] < target
          return -1 if current_index - 1 < 0
          return search(nums, target, start_index, current_index - 1) if nums[current_index - 1]
      else
          return start_index if nums[start_index] == target
          return -1 if current_index + 1 > nums.length - 1
          return search(nums, target, current_index + 1, end_index)
      end       
  else
      if nums[end_index] < current_number && nums[start_index] > target
          return -1 if current_index + 1 > nums.length - 1
          return search(nums, target, current_index + 1, end_index) 
      else
          return end_index if nums[end_index] == target
          return -1 if current_index - 1 < 0
          return search(nums, target, start_index, current_index - 1)
      end
  end
end