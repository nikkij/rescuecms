FactoryGirl.define do 
  factory :address do
    street    '123 Test'
    city      'Colorado Springs'
    state     State.find(1)
    zip_code  '11111'
  end
end