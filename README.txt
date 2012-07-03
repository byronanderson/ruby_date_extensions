Quarter and Month classes to plug into date and time classes in ruby

The inspiration for these extensions are to be able to use enumerable methods to aggregate via these new concepts of quarter and month

ex:

grouped_by_quarter = profits.group_by { |profit| profit.date.to_quarter }

Authored by Byron Anderson
