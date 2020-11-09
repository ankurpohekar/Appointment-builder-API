FactoryBot.define do
  factory :appointment do
    date { "2020-2-22" }
    doctor_id {1}
    slot_id {1}
    user_id {1}
  end
end
