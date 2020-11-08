class Api::V1::SlotsController < ApplicationController
	before_action :authorize_request

	def index
      @slots = Slot.all
	end
end