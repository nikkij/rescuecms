require 'rails_helper'
require 'spec_helper'
require 'carrierwave/test/matchers'

describe Animal do
  include CarrierWave::Test::Matchers

  before :each do
    @animal = FactoryGirl.create(:animal)
  end

  it 'has a valid Factory' do
    FactoryGirl.build(:animal).should be_valid
  end

  describe "relations" do
    it {should belong_to(:animal_species)}
    it {should belong_to(:animal_sex)}
    it {should belong_to(:animal_type)}
    it {should belong_to(:animal_color)}
    it {should belong_to(:animal_coat_type)}
    it {should belong_to(:animal_size)}
    it {should belong_to(:animal_species)}
    it {should belong_to(:animal_breed)}
  end

  
  describe '#new' do
    it 'returns a Animal object' do
      @animal.should be_an_instance_of Animal
    end
  end

  describe '#picture' do
    it 'returns the correct picture' do
      expect(@animal.picture_url).to  match(/http:\/\/res.cloudinary.com\/hwtphffjr\/image\/upload.+/)
      #@animal.picture_url.should eq("/home/vagrant/sheltercms-0.0.1/spec/support/animal/pictures/pip.jpg")
    end
  end
end
