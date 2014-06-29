FactoryGirl.define do 
  factory :animal do |f| 
  	f.name "Charlie"
  	f.picture {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec','support','animal','pictures','pip.jpg'))}
    #f.picture File.open(File.join(Rails.root,'spec','support','animal','pictures','pip.jpg'))
  end 
end