class Facility < ApplicationRecord
  validates_presence_of :name, :description
  has_many :bookings, :dependent => :destroy
  has_many :timeslots, :dependent => :destroy

  def self.start_time
   [ 1 , 2 , 3 , 4 , 5 , 6 ,
    7 , 8 , 9 , 10 , 11 , 12 ,
    13 , 14 , 15 , 16 , 17 , 18 ,
    19 , 20 , 21 , 22 , 23 , 00 ]
  end

  def self.time_slot
    [1, 2, 3, 4, 5, 6]
  end

  def self.hours
    [1, 2, 3, 4]
  end
end
