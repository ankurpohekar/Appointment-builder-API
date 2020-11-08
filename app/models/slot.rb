class Slot < ApplicationRecord
  
  validates_presence_of :start_time, :name
  validates_uniqueness_of :start_time, :name

  has_many :appointment_slots
end