require 'rails_helper'

RSpec.describe Api::V1::AppointmentsController, type: [:request, :controller] do
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
  describe 'POST #create' do

    context 'with valid attributes' do
      it 'create appointments with valid condition' do
        jwt = authenticated_header(request, user)
        headers = { "Authorization" => "Bearer #{jwt}", "Content-Type" => "application/json" }
        post "/api/v1/appointments", params: { appointment: {date: "2020-2-22", doctor_id: doctor_1.id, slot_id: slot_a.id} }.to_json, headers: headers
        expect(response.body).to include("appointment booked successfully")
      end
    end

    context 'with invalid attributes' do
        let!(:appointment) { create(:appointment, date: "2020-2-22", doctor_id: doctor_1.id, slot_id: slot_a.id, user_id: user.id ) }
      it 'create appointments with invalid condition' do
        jwt = authenticated_header(request, user)
        headers = { "Authorization" => "Bearer #{jwt}", "Content-Type" => "application/json" }
        post "/api/v1/appointments", params: { appointment: {date: "2020-2-22", doctor_id: doctor_1.id, slot_id: slot_a.id} }.to_json, headers: headers
        expect(response.body).to include("selected slot alredy booked please try with diffrent slot")
        #expect(response).to have_http_status(200)
      end
    end

    context 'with invalid slot id' do
      it 'create appointments with invalid slot id' do
        jwt = authenticated_header(request, user)
        headers = { "Authorization" => "Bearer #{jwt}", "Content-Type" => "application/json" }
        post "/api/v1/appointments", params: { appointment: {date: "2020-2-22", doctor_id: doctor_1.id, slot_id: 20} }.to_json, headers: headers
        expect(JSON.parse(response.body)["error"]).to include("Appointment slots is invalid")
      end
    end

    context 'with invalid doctor' do
      it 'create appointments with invalid doctor id' do
        jwt = authenticated_header(request, user)
        headers = { "Authorization" => "Bearer #{jwt}", "Content-Type" => "application/json" }
        post "/api/v1/appointments", params: { appointment: {date: "2020-2-22", doctor_id: 0, slot_id: slot_a.id} }.to_json, headers: headers
        expect(JSON.parse(response.body)["error"]).to include("Invalid doctor")
      end
    end
  end

  describe 'GET #index' do
    context 'get all appointments' do
      let!(:appointment) { create(:appointment, date: Date.current, doctor_id: doctor_1.id, slot_id: slot_d.id, user_id: user.id ) }
      it 'populates an array of appointments and renders the json response' do
        jwt = authenticated_header(request, user)
        headers = { "Authorization" => "Bearer #{jwt}", "Content-Type" => "application/json" }
        get "/api/v1/appointments", params: {type: "day"}.to_json, headers: headers
        expect(JSON.parse(response.body)["appointment"].size).to eq(1)
      end
    end

    context 'get appointments' do
      let!(:appointment) { create(:appointment, date: Date.current, doctor_id: doctor_1.id, slot_id: slot_a.id, user_id: user.id ) }
      let!(:appointment2) { create(:appointment, date: Date.current + 1.week, doctor_id: doctor_2.id, slot_id: slot_b.id, user_id: user.id ) }

      let!(:appointment3) { create(:appointment, date: Date.current + 1.week, doctor_id: doctor_3.id, slot_id: slot_c.id, user_id: user.id ) }
      it 'populates an array 1 week of appointments and renders the json response' do
        jwt = authenticated_header(request, user)
        headers = { "Authorization" => "Bearer #{jwt}", "Content-Type" => "application/json" }
        get "/api/v1/appointments", params: {type: "week"}.to_json, headers: headers
        expect(JSON.parse(response.body)["appointment"].size).to eq(3)
      end
    end
  end
end