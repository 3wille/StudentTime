FactoryGirl.define do
  factory :time_entry do
    user
    length "1"
    date Date.today
  end
end
