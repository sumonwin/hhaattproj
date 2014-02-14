class Attendance < ActiveRecord::Base
  attr_accessible :date, :leavetime, :reachtime, :userid
  belongs_to:users
  validates:userid,presence:true
  self.per_page=5
end
WillPaginate.per_page=5 

