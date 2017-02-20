require 'pry'

class Triangle
  attr_accessor :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    arr = [side_1, side_2, side_3]
    if arr.uniq.count == 1 && !(arr.include?(0))
      :equilateral
    elsif arr.uniq.count == 2 && !(triangle_inequality(arr))
      :isosceles
    elsif triangle_inequality(arr) || arr.any?{|num| num <= 0}
      raise TriangleError
    else
      :scalene
    end
  end

  def triangle_inequality(arr)
    arr.each do |number|
      if arr.reduce(:+) - number <= number
        return true
      end
    end
    false
  end

end

class TriangleError <StandardError
end
