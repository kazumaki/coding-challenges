# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  return [] if nums.length < 3
  
  return [nums] if nums.length == 3 && nums.inject(:+) == 0
  
  nums_hash = nums.reduce({}) do |hash, number|
      hash[number] = hash[number] ? hash[number] + 1 : 1
      hash
  end

  arr = []

  results = Set.new
  checked_nums = Set.new
  
  (0).upto(nums.length - 3) do |index|
      current_number = nums[index]
      next unless checked_nums.add? current_number
      (index + 1).upto(nums.length - 2) do |inner_index|
          inner_current_number = nums[inner_index]
          target = -(current_number + inner_current_number)

          next unless nums_hash[target]

          nums_hash[current_number] -= 1
          nums_hash[inner_current_number] -= 1
          if nums_hash[target] > 0
              target_arr = [current_number, inner_current_number, target].sort!
              arr.push(target_arr) if results.add?("#{target_arr[0]}-#{target_arr[1]}-#{target_arr[2]}")
          end
          nums_hash[current_number] += 1
          nums_hash[inner_current_number] += 1
      end
  end
  arr
end
