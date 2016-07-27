FactoryGirl.define do
  factory :user do
    name "MyString"
    last_seen_at "2016-07-27 08:45:45"
    web_sessions 1
    app nil
  end
end
