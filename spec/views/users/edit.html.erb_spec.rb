require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      email: "MyString",
      crypted_password: "MyString",
      salt: "MyString",
      name: "MyString"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[crypted_password]"

      assert_select "input[name=?]", "user[salt]"

      assert_select "input[name=?]", "user[name]"
    end
  end
end
