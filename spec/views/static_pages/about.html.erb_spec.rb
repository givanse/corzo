require 'spec_helper'

describe "static_pages/about.html.erb" do

  subject { page }

  before { visit about_path }

  it { should have_content('About Us') } 

  it { should have_title('About Us') } 

end                                                                            
