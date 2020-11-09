require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: [:request, :controller] do
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
    context 'get all doctors list' do
      it 'populates an array of doctors and renders the json response' do
        jwt = authenticated_header(request, user)
        headers = { "Authorization" => "Bearer #{jwt}", "Content-Type" => "application/json" }
        get "/api/v1/doctors", params: {type: "day"}.to_json, headers: headers
        expect(JSON.parse(response.body)["doctors"].size).to eq(3)
      end
    end

    context 'get appointments for specific doctor' do
      let!(:appointment) { create(:appointment, date: Date.current, doctor_id: doctor_1.id, slot_id: slot_a.id, user_id: user.id ) }
      let!(:appointment2) { create(:appointment, date: Date.current + 1.week, doctor_id: doctor_1.id, slot_id: slot_b.id, user_id: user.id ) }
      let!(:appointment3) { create(:appointment, date: Date.current + 1.week, doctor_id: doctor_1.id, slot_id: slot_c.id, user_id: user.id ) }
      it 'populates an array appointments for specific doctor and renders the json response' do
        jwt = authenticated_header(request, user)
        headers = { "Authorization" => "Bearer #{jwt}", "Content-Type" => "application/json" }
        get "/api/v1/doctors/#{doctor_1.id}", params: {}, headers: headers
        expect(JSON.parse(response.body)["doctor"].size).to eq(3)
      end
    end
  end
end