class Triangle

  OPTIONS = %w{Equilateral Right Isosceles Scalene NotATriangle}
  attr_reader :type

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @type = triangle_type(a, b, c)
  end

  private

  def triangle_type(a, b, c)
    if equilateral?
      OPTIONS[0]
    elsif pythagorean?
      OPTIONS[1]
    elsif is_triangle?
      if two_sides_equal?
        OPTIONS[2]
      else
        OPTIONS[3]
      end
    else
      OPTIONS[4]
    end
  end

  def two_sides_equal?
    [@a, @b, @c].uniq.count == 2
  end

  def equilateral?
    @a == @b && @b == @c
  end

  def pythagorean?
    @a ** 2 + @b ** 2 == @c ** 2
  end

  def is_triangle?
    all_sides = [@a, @b, @c]
    all_sides.combination(2).each do |combo|
      last_side = all_sides.reject { |i| combo.include?(i) }.first || combo.first
      return false if combo.inject(:+) < last_side
    end
    true
  end
end














