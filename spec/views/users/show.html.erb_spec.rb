require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :id => "Id",
      :role_id => "Role",
      :name => "Name",
      :phone_number => "Phone Number",
      :email => "Email",
      :encrypted_password => "Encrypted Password",
      :reset_password_token => "Reset Password Token",
      :reset_password_sent_at => "Reset Password Sent At",
      :remember_created_at => "Remember Created At",
      :sign_in_count => "Sign In Count",
      :current_sign_in_at => "Current Sign In At",
      :last_sign_in_at => "Last Sign In At",
      :current_sign_in_ip => "Current Sign In Ip",
      :last_sign_in_ip => "Last Sign In Ip",
      :created_at => "Created At",
      :updated_at => "Updated At"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Id/)
    rendered.should match(/Role/)
    rendered.should match(/Name/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Email/)
    rendered.should match(/Encrypted Password/)
    rendered.should match(/Reset Password Token/)
    rendered.should match(/Reset Password Sent At/)
    rendered.should match(/Remember Created At/)
    rendered.should match(/Sign In Count/)
    rendered.should match(/Current Sign In At/)
    rendered.should match(/Last Sign In At/)
    rendered.should match(/Current Sign In Ip/)
    rendered.should match(/Last Sign In Ip/)
    rendered.should match(/Created At/)
    rendered.should match(/Updated At/)
  end
end
