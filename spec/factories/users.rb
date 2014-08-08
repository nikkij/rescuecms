FactoryGirl.define do
  factory :user do
      #first_name            "Bob"
      #last_name             "Sinclar"
      #date_of_birth         "03/12/1982"
      #gender                "M"
      #sequence(:username)   { |n| "bsinclar#{n}" }
      #email                 { "#{username}@example.com" }
      email                 "testuser1@test.com"
      password              "foobar"
      password_confirmation "foobar"
  end
end