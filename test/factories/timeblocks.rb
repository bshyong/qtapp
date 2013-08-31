# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timeblock do
    starttime "2013-08-31 11:31:42"
    endtime "2013-08-31 11:31:42"
    user_id 1
    duration 1
  end
end
