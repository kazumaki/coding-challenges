# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target, start_row = nil, end_row = nil)
  return false if matrix.length == 0
  
  start_row = 0 unless start_row
  end_row = matrix.length - 1 unless end_row
  
  return false if start_row > end_row
  
  current_row = (start_row + end_row) / 2
  
  if target.between?(matrix[current_row].first, matrix[current_row].last)
      return search_array(matrix[current_row], target)
  elsif target < matrix[current_row].first
      return search_matrix(matrix, target, start_row, current_row - 1)
  else
      return search_matrix(matrix, target, current_row + 1, end_row)
  end
end

def search_array(array, target, start_index = nil, end_index = nil)
  return false if array.length == 0
  
  start_index = 0 unless start_index
  end_index = array.length - 1 unless end_index
  current_index = (start_index + end_index) / 2
  
  return false if start_index > end_index
  
  current_number = array[current_index]
  
  return true if target == current_number
  
  if target > current_number
      return search_array(array, target, current_index + 1, end_index)
  else
      return search_array(array, target, start_index, current_index - 1)
  end
end