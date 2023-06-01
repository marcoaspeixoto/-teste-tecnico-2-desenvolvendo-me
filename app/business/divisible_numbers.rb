class DivisibleNumbers
  def divisible_numbers(x, y, w)
    divisible_numbers = []

    (x..y).each do |num|
      divisible_numbers << num if (num % w).zero?
    end

    divisible_numbers
  end
end

