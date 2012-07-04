require 'date'
require './lib/date_extensions'
describe Date do
  subject { Date.new(2012, 6, 29) }

  its(:to_quarter) { should == Quarter.new(2, 2012) }
  its(:to_month) { should == Month.new(6, 2012) }
end
