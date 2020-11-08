class Api::V1::AppointmentsController < ApplicationController
	before_action :authorize_request
  
  def index
    @appointments = Appointment.all
  end

	def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
    	@appoint =  Appointment.joins(:doctor, appointment_slots: :slot).select("appointments.*, slots.name AS sname, slots.start_time, doctors.name AS dname").find(appointment.id)
      @message = "appointment booked successfully"
    else
    	render json: {error: appointment.errors.full_messages.join(", ")}
    end
	end

  private
  def appointment_params
  	params.require(:appointment).permit(:date, :doctor_id, :slot_id).merge(user_id: current_user.id)
  end
end