class Api::V1::DoctorsController < ApplicationController
	before_action :authorize_request

	def index
    @doctors = Doctor.all
	end
end