require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      email: "Email",
      crypted_password: "Crypted Password",
      salt: "Salt",
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Crypted Password/)
    expect(rendered).to match(/Salt/)
    expect(rendered).to match(/Name/)
  end
end
