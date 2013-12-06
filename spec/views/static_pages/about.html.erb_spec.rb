require 'spec_helper'

describe "static_pages/about.html.erb" do
 
  it "should have the content 'About Us'" do                                       
    visit about_path
    expect(page).to have_content('About Us')                                       
  end                                                                          

  it "should have the title 'About Us'" do
     visit about_path
     expect(page).to have_title('About Us')
  end
end                                                                            
