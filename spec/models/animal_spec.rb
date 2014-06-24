require 'rails_helper'

RSpec.describe Animal, :type => :model do
  before :each do
    @animal = Animal.new
  end
  
  describe '#new' do
    it 'returns a Animal object' do
      @animal.should be_an_instance_of Animal
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @animal.name='Charlie'
      expect(@animal.name).to eq 'Charlie'
    end
  end

  describe '#code' do
    it 'returns the correct code' do
      @animal.code='U2014001'
      expect(@animal.code).to eq 'U2014001'
    end
  end

  describe '#short_code' do
    it 'returns the correct short code' do
      @animal.code='1235'
      expect(@animal.code).to eq '1235'
    end
  end

  describe '#litter' do
    it 'returns the correct litter' do
      @animal.litter='houston'
      expect(@animal.litter).to eq 'houston'
    end
  end

  describe '#animal_sex' do
    it 'returns the correct animal sex' do
      @animal.animal_sex_id=1
      expect(@animal.animal_sex.name).to eq 'Female'
    end
  end
end
