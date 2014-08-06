FactoryGirl.define do 
  factory :animal do
  	name "Charlie"
  	code 1111
  	animal_status_id 1
  	animal_type_id 1
  	location_id 1
  	picture {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec','support','animal','pictures','pip.jpg'))}
  end
end