require './lib/date_extensions'
describe Month do
  subject { Month.new(2, 2012) }

  it { should == Month.new(2, 2012) }
  its(:to_s) { should == "February 2012" }
  its(:start_date) { should == Date.new(2012, 2, 1) }
  its(:end_date)   { should == Date.new(2012, 2, 29) }

  it "should be able to be aggregated by" do
    first = Date.new(2012, 1, 1)
    by_month = [first, first + 1, first - 1].group_by { |date| date.to_month }
    expected = {
      Month.new(1, 2012) => [first, first + 1],
      Month.new(12, 2011) => [first - 1]
    }
    by_month.should == expected
  end

  it "should be case equal if the date is within the date range" do
    date = Date.new(2012, 2, 3)
    value = case date
    when subject
      "right"
    else
      "wrong"
    end
    value.should == "right"
  end
end
