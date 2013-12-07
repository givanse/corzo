require 'spec_helper'

describe User do

  # Note: encrypted_password will be the final field
  # 
  # Devise uses internally password and password_confirmation and later 
  # saves only the encrypted string.
  before { @user = User.new('role_id' => 3,
                            name: 'Example User', 
                            'phone_number' => '3300001111',
                            email: 'user@example.com',
                            password: 'secretpass',
                            password_confirmation: 'secretpass') }

  subject { @user }

  it { should respond_to('role_id') }

  it { should respond_to(:name) }

  it { should respond_to('phone_number') }

  it { should respond_to(:email) }

  it { should respond_to('encrypted_password') } # Devise defined this one

  it { should be_valid }

  describe "when role_id is not present" do
    before { @user.role_id = nil }
    #TODO: add this validation
    #it { should_not be_valid }
  end
 
  describe "when name is not present" do
    before { @user.name = " " }
    it { should be_valid }
  end

end
