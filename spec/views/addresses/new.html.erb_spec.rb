require 'rails_helper'

RSpec.describe "addresses/new", :type => :view do
  before(:each) do
    assign(:address, Address.new(
      :street => "",
      :addressable_id => "",
      :addressable_type => "MyString"
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input#address_street[name=?]", "address[street]"

      assert_select "input#address_addressable_id[name=?]", "address[addressable_id]"

      assert_select "input#address_addressable_type[name=?]", "address[addressable_type]"
    end
  end
end
