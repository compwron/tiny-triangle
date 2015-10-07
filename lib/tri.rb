class Tri

  OPTIONS = %w{Equilateral Isosceles Right Scalene NotATriangle}
  attr_reader :type

  def initialize(a, b, c)
    @type = triangle_type(a, b, c)
  end

  private

  def triangle_type(a, b, c)
    if a == b && b == c
      OPTIONS[0]
    elsif [a, b, c].uniq.count == 2 && is_triangle?(a, b, c)
      OPTIONS[1]
    elsif pythagorean(a, b, c)
      OPTIONS[2]
    elsif is_triangle?(a, b, c)
      OPTIONS[3]
    else
      OPTIONS[4]
    end
  end

  def pythagorean(a, b, c)
    a * a + b * b == c * c
  end

  def is_triangle?(a, b, c)
    [a, b, c].combination(2).each { |combo|
      if combo.inject(&:+) < ([a, b, c].select {|i| !combo.include?(i)}.first || combo.first)
        return false
      end
    }
    true
  end
end
