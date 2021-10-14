# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums_hash = {}
  0.upto(nums.length - 1) do |i|
      difference = target - nums[i]
      return [i, nums_hash[difference]] if nums_hash.key? difference
      nums_hash[nums[i]] = i
  end
end