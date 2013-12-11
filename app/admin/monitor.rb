ActiveAdmin.register_page "Monitor" do

  menu :priority => 100

  page_action :ex, :method => :post do
    # do stuff here
    redirect_to admin_monitor_path, :notice => "You did stuff!"
  end

  action_item do
    link_to "Do Stuff", admin_monitor_ex_path, :method => :post
  end

  content do
    para "Hello World"
  end

end
