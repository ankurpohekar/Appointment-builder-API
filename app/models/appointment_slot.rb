class AppointmentSlot < ApplicationRecord  
  belongs_to :slot
  belongs_to :appointment
end