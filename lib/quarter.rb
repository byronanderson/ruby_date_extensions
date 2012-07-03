class Quarter
  attr_accessor :number, :year
  def initialize(number, year)
    @number, @year = number, year
  end

  def to_s
    "Q#{number} #{year}"
  end

  def ==(other)
    (number == other.number) and (year == other.year)
  end

  def eql?(other)
    (self == other) and other.class == Quarter and self.class == Quarter
  end

  def hash
    number.hash + year.hash
  end

  def ===(other)
    to_range === other
  end

  def start_date
    Date.new(year, number * 3 - 2)
  end

  def end_date
    Date.new(year, (number + 1) * 3 - 2) - 1
  end

  def to_range
    start_date..end_date
  end
end
