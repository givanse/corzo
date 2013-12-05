require 'spec_helper'

describe "static_pages/about.html.erb" do
 
  it "should have the content 'About Us'" do                                       
    visit '/static_pages/about'                                                 
    expect(page).to have_content('About Us')                                       
  end                                                                          
end                                                                            
