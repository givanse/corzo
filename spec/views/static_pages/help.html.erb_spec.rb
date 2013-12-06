require 'spec_helper'

describe "static_pages/help.html.erb" do

  subject { page }

  before { visit help_path }

  it { should have_content('Help') } 

  it { should have_title('Help') } 

end                                                                            
