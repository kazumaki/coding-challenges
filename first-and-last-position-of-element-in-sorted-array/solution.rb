# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target, start_index = nil, end_index = nil)
  return [-1, -1] if nums.empty?
  
  start_index = 0 unless start_index
  end_index = nums.length - 1 unless end_index 

  return [-1, -1] if start_index > end_index
  
  current_index = (start_index + end_index) / 2
  
  current_number = nums[current_index]
  
  if current_number == target
      return [0, 0] if nums.length == 1
      local_start = current_index
      local_end = current_index

      current_index.downto(0) do |i|
          local_start = i if nums[i] == target
          break if nums[i] != target
      end
      
      current_index.upto(nums.length - 1) do |i|
          local_end = i if nums[i] == target
          break if nums[i] != target
      end

      return [local_start, local_end]
  elsif current_number > target
      return search_range(nums, target, start_index, current_index - 1)
  else current_number < target
      return search_range(nums, target, current_index + 1, end_index)
  end
end