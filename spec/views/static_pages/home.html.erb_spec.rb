require 'spec_helper'

describe 'static_pages/home.html.erb' do
  subject { page }

  before { visit root_path }

  it { should have_content('Sample App') }

  it { should have_title('Home') }

end                                                                            
