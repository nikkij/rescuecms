require 'rails_helper'

RSpec.describe Animal, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before :each do
    @animal = Animal.new
  end
  
  describe '#new' do
    it 'returns a Animal object' do
      # setup
      # exercise
      # verify
      # teardown
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
      expect(@animal.litter='houston')
    end
  end
end
