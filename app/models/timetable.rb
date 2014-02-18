class Timetable < ActiveRecord::Base
  attr_accessible :classname, :duration, :endtime, :friday, :jplevel, :monday, :saturaday, :school, :startdate, :starttime, :sunday, :thursday, :tuesday, :wednesday
has_many:travelfees
has_many:attendances, :through => :travelfees

validates :classname, presence: true
self.per_page=5
end
WillPaginate.per_page=5
