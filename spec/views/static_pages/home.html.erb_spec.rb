require 'spec_helper'

describe "static_pages/home.html.erb" do
 
  it "should have the content 'Sample App'" do                                 
    visit root_path 
    expect(page).to have_content('Sample App')                                 
  end                                                                          

  it "should have the title 'Home'" do
    visit root_path
    expect(page).to have_title('Home')
  end

end                                                                            
                                                                                 
