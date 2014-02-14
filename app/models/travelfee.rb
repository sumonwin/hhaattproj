class Travelfee < ActiveRecord::Base
  attr_accessible :classname, :date, :travel_fee, :userid
  belongs_to:users
  belongs_to:timetables
  validates :travel_fee,  presence: true , numericality:{only_integer:true}
  validates :classname, presence: true 
  validates :userid, presence: true
  self.per_page=5
end
WillPaginate.per_page=5
