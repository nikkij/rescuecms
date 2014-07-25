require 'rails_helper'

RSpec.describe "addresses/edit", :type => :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :street => "",
      :addressable_id => "",
      :addressable_type => "MyString"
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_street[name=?]", "address[street]"

      assert_select "input#address_addressable_id[name=?]", "address[addressable_id]"

      assert_select "input#address_addressable_type[name=?]", "address[addressable_type]"
    end
  end
end
