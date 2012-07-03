require 'date'
class Month
  attr_accessor :number, :year
  def initialize(number, year)
    @number, @year = number, year
  end

  def to_s
    first_date.strftime("%B %Y")
  end

  def first_date
    Date.new(year, number)
  end

  def month
    number
  end

  def ==(other)
    (month == other.month) and (year == other.year)
  end

  def to_range
    start_date..end_date
  end

  def ===(other)
    to_range === other
  end

  def eql?(other)
    (self == other) and other.class == Month and self.class == Month
  end

  def hash
    month.hash + year.hash
  end

  def start_date
    Date.new(year, number)
  end

  def succ
    if number == 12
      Date.new(year + 1, 1)
    else
      Date.new(year, number + 1)
    end
  end

  def end_date
    succ - 1
  end
end
