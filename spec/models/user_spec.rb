require 'rails_helper'


RSpec.describe User, :type => :model do
#describe User do

  it 'has a valid Factory' do
    FactoryGirl.build(:user).should be_valid
  end

end
