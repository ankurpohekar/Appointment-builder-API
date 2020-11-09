class Api::V1::DoctorsController < ApplicationController
	before_action :authorize_request

	def index
    @doctors = Doctor.all
	end

	def show
	  @doctors = Doctor.joins(appointments: [appointment_slots: :slot]).select("appointments.*, slots.name AS sname, slots.start_time, doctors.name AS dname").where(id: params[:id])
	end

end