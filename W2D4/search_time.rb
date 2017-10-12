
def quadratic_time(fishes)
  fishes.each_with_index do |fish1, i|
    max_l = true
    fishes.each_with_index do |fish2, j|
      next if i == j
      max_l = false if fish2.length > fish1.length
    end

    return fish1 if max_l == true
  end

end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x,y| x <=> y }

    return self if count <=1

    mid = self.length/2

    sorted_right = self.take(mid).merge_sort(&prc)
    sorted_left = self.drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged <<left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end
