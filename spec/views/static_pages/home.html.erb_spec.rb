require 'spec_helper'

describe "static_pages/home.html.erb" do
 
  it "should have the content 'Sample App'" do                                 
    visit '/static_pages/home'                                                 
    expect(page).to have_content('Sample App')                                 
  end                                                                          

  it "should have the title 'Home'" do
    visit '/static_pages/home'
    expect(page).to have_title('Home')
  end

end                                                                            
                                                                                 
