require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
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
      ),
      stub_model(User,
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
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Id".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Reset Password Token".to_s, :count => 2
    assert_select "tr>td", :text => "Reset Password Sent At".to_s, :count => 2
    assert_select "tr>td", :text => "Remember Created At".to_s, :count => 2
    assert_select "tr>td", :text => "Sign In Count".to_s, :count => 2
    assert_select "tr>td", :text => "Current Sign In At".to_s, :count => 2
    assert_select "tr>td", :text => "Last Sign In At".to_s, :count => 2
    assert_select "tr>td", :text => "Current Sign In Ip".to_s, :count => 2
    assert_select "tr>td", :text => "Last Sign In Ip".to_s, :count => 2
    assert_select "tr>td", :text => "Created At".to_s, :count => 2
    assert_select "tr>td", :text => "Updated At".to_s, :count => 2
  end
end
