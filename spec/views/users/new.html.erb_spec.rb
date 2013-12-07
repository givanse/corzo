require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :id => "MyString",
      :role_id => "MyString",
      :name => "MyString",
      :phone_number => "MyString",
      :email => "MyString",
      :encrypted_password => "MyString",
      :reset_password_token => "MyString",
      :reset_password_sent_at => "MyString",
      :remember_created_at => "MyString",
      :sign_in_count => "MyString",
      :current_sign_in_at => "MyString",
      :last_sign_in_at => "MyString",
      :current_sign_in_ip => "MyString",
      :last_sign_in_ip => "MyString",
      :created_at => "MyString",
      :updated_at => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_id[name=?]", "user[id]"
      assert_select "input#user_role_id[name=?]", "user[role_id]"
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_phone_number[name=?]", "user[phone_number]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_encrypted_password[name=?]", "user[encrypted_password]"
      assert_select "input#user_reset_password_token[name=?]", "user[reset_password_token]"
      assert_select "input#user_reset_password_sent_at[name=?]", "user[reset_password_sent_at]"
      assert_select "input#user_remember_created_at[name=?]", "user[remember_created_at]"
      assert_select "input#user_sign_in_count[name=?]", "user[sign_in_count]"
      assert_select "input#user_current_sign_in_at[name=?]", "user[current_sign_in_at]"
      assert_select "input#user_last_sign_in_at[name=?]", "user[last_sign_in_at]"
      assert_select "input#user_current_sign_in_ip[name=?]", "user[current_sign_in_ip]"
      assert_select "input#user_last_sign_in_ip[name=?]", "user[last_sign_in_ip]"
      assert_select "input#user_created_at[name=?]", "user[created_at]"
      assert_select "input#user_updated_at[name=?]", "user[updated_at]"
    end
  end
end
