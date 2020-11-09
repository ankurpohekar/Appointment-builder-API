FactoryBot.define do
  factory :slot_a, class: "Slot" do
    name { "Slot-A" }
    start_time {"10 AM"}
  end
  factory :slot_b, class: "Slot" do
    name { "Slot-B" }
    start_time {"12 PM"}
  end
  factory :slot_c, class: "Slot" do
    name { "Slot-C" }
    start_time {"2 PM"}
  end
  factory :slot_d, class: "Slot" do
    name { "Slot-D" }
    start_time {"4 PM"}
  end
  factory :slot_e, class: "Slot" do
    name { "Slot-E" }
    start_time {"6 PM"}
  end
end
