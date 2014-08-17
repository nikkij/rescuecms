require 'rails_helper'

RSpec.describe Admin::LocationsController, :type => :controller do

  before(:each) do
    @user = FactoryGirl.build(:user)
    login_user(@user)
  end

  # This should return the minimal set of attributes required to create a valid
  # Location. As you add validations to Location, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
     {:as_location_id =>100,:as_location_type=>'ResidenceLocation'}
  }

  let(:valid_onpremises_attributes) {
    {:area=>'Lobby',:unit=>1}
  }

  let(:valid_residence_attributes) {
    {:address=>FactoryGirl.build(:address)}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LocationsController. Be sure to keep this updated too.
  let(:valid_session) { 
  }

  describe "GET index" do
    it "assigns all locations as @locations" do
      location = Location.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:locations)).to eq([location])
    end
  end

  describe "GET show" do
    it "assigns the requested on premises location as @location" do
      location = OnPremisesLocation.create! valid_onpremises_attributes
      request.stub(:path).and_return("/admin/on_premises_location/1")
      get :show, {:id => location}, valid_session
      expect(assigns(:location)).to eq(location)
    end

    it "assigns the requested residence location as @location" do
      location = ResidenceLocation.create! valid_residence_attributes
      request.stub(:path).and_return("/admin/residence_location/1")
      get :show, {:id => location}, valid_session
      expect(assigns(:location)).to eq(location)
    end
  end

end
