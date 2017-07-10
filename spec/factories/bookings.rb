FactoryGirl.define do
  factory :booking do
    name "MyString"
    start_time "2017-04-24 17:09:58"
    association :facility
    association :building
  end
end
