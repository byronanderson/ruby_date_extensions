require './lib/date_extensions'
describe Quarter do
  subject { Quarter.new(1, 2012) }

  it { should == Quarter.new(1, 2012) }
  its(:start_date) { should == Date.new(2012, 1, 1) }
  its(:end_date)   { should == Date.new(2012, 3, 31) }
  its(:to_s) { should == "Q1 2012" }

  it "should be able to be aggregated by" do
    first = Date.new(2012, 1, 1)
    by_quarter = [first, first + 1, first - 1].group_by { |date| date.to_quarter }
    expected = {
      Quarter.new(1, 2012) => [first, first + 1],
      Quarter.new(4, 2011) => [first - 1]
    }
    by_quarter.should == expected
  end

  it "should be smart about case equality" do
    # 3 January 2012 is in quarter 1
    date = Date.new(2012, 1, 3)
    value = case date
    when subject
      "right"
    else
      "wrong"
    end
    value.should == "right"
  end
end
