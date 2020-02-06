def matrix_addition_reloaded(*arr_of_mtrx)
    return nil if arr_of_mtrx.any? { |mtrx| mtrx.length != arr_of_mtrx[0].length }
    mtrx_a = arr_of_mtrx[0]

    mtrx_a.each_with_index.map do |sub, i|
        sub.each_with_index.map do |cord_1, j|
            arr_of_mtrx.map { |mtrx| mtrx[i][j] }.sum
        end
    end  
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr_2d)
    (0...arr_2d.length).each do |i|
        return true if arr_2d[i].uniq.size <= 1
        return true if (0...arr_2d.length).map { |j| arr_2d[j][i] }.uniq.size <= 1
    end
    false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal? (mstr_arr)

    return true if (0...mstr_arr.length).map { |i| mstr_arr[i][i] }.uniq.size <= 1
    mstr_arr = mstr_arr.map { |sub| sub.reverse }
    return true if (0...mstr_arr.length).map { |i| mstr_arr[i][i] }.uniq.size <= 1

    false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(n)
    return [[1]] if n == 1

    previous_layers = pascals_triangle(n-1) # [[1]]
    previous_layer = previous_layers[n-2] # [1]
    new_layer = (0...n).map do |i|
        i > 0 ? part_1 = previous_layer[i-1] : part_1 = 0
        part_2 = previous_layer[i] ||= 0
        part_1 + part_2
    end

    return pascals_triangle(n-1) << new_layer
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]