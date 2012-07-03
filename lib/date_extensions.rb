require './lib/quarter'
require './lib/month'
class Date
  def to_quarter
    q = (month - 1) / 3 + 1
    Quarter.new(q, year)
  end

  def to_month
    Month.new(month, year)
  end
end
