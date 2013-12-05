require 'spec_helper'

describe "static_pages/help.html.erb" do
 
  it "should have the content 'Help'" do                                       
    visit '/static_pages/help'                                                 
    expect(page).to have_content('Help')                                       
  end                                                                          

  it "should have the title 'Help'" do
     visit '/static_pages/help'
     expect(page).to have_title('Help')
  end

end                                                                            
