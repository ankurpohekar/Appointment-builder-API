require 'rails_helper'

RSpec.describe Api::V1::SlotsController, type: [:request, :controller] do
  render_views
  include ApiHelper

  let!(:slot_a) {create(:slot_a)}
  let!(:slot_b) {create(:slot_b)}
  let!(:slot_c) {create(:slot_c)}
  let!(:slot_d) {create(:slot_d)}
  let!(:slot_e) {create(:slot_e)}
  let!(:doctor_1) {create(:doctor1)}
  let!(:doctor_2) {create(:doctor2)}
  let!(:doctor_3) {create(:doctor3)}
  let!(:user) {create(:user)}

  describe 'GET #index' do
    context 'get all slots' do
      it 'populates an array of all available slot for appontment and renders the json response' do
        jwt = authenticated_header(request, user)
        headers = { "Authorization" => "Bearer #{jwt}", "Content-Type" => "application/json" }
        get "/api/v1/slots", params: {}, headers: headers
        expect(JSON.parse(response.body)["slots"].size).to eq(5)
      end
    end
  end
end