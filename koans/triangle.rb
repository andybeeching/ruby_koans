# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)

  # Test for valid dimensions else, throw error
  raise TriangleError if a<=0 or b<=0 or c<=0
  raise TriangleError if a+b<=c or b+c<=a or a+c<=b

  # Continue test
  result = :equilateral
  test = []

  # Test each side
  test << a - b
  test << b - c
  test << a - c

  if test != [0,0,0]
    result = test.include?(0) ? :isosceles : :scalene
  end

  return result

  # Interesting solution from https://gist.github.com/1126423
  # def triangle(a, b, c)
  #   a, b, c = sides = [a, b, c].sort
  #   raise TriangleError unless a > 0 and a + b > c
  #   [:scalene, :isosceles, :equilateral][-sides.uniq.size]
  # end

end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
