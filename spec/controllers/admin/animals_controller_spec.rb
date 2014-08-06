require 'rails_helper'

RSpec.describe Admin::AnimalsController, :type => :controller do
  before(:each) do
  	@user = Factory(:user)
    login_user(@user)
  end
end
