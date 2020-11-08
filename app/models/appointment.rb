class Appointment < ApplicationRecord
  attr_accessor :slot_id
  validates_presence_of :date, :user_id, :doctor_id
  
  belongs_to :doctor
  belongs_to :user
  has_many :appointment_slots
  validate :appointment_date, on: :create
  before_validation :create_appointment_slots, on: :create
  

  scope :filter_appointments, ->(type) do
    if type == "day"
      where(created_at: DateTime.current.beginning_of_day..DateTime.current.end_of_day)
    elsif type == "week"
      where(created_at: (DateTime.current - 1.week)..DateTime.current.end_of_day)
    end
  end
  
  private
  
  def appointment_date
  	appointment = Appointment.find_by(date: self.date, doctor_id: self.doctor_id)
  	if appointment.present?
  	  slot = Slot.find(self.slot_id)
      byebug
  	  if slot.present?
  	    appointment_slot = AppointmentSlot.find_by(appointment_id: appointment.id,slot_id: slot.id)
  	    if appointment_slot.nil?
          return true
        else
          errors.add(:base, "alredy booked please try diffrent slot")
        end
      end
    end
  end

  def create_appointment_slots
  	self.appointment_slots.build(slot_id: self.slot_id)
  end
end