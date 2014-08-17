require 'rails_helper'

RSpec.describe Admin::AnimalsController, :type => :controller do
  before(:each) do
  	@user = FactoryGirl.build(:user)
    login_user(@user)
  end
end
