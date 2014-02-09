ActiveAdmin.register_page "MONITOR" do

  menu :priority => 100

  # New window
  action_item do
    link_to "Nueva Ventana", monitor_path, :target => "_blank"
  end

  # This window
  page_action :open_window do
    redirect_to monitor_path
  end

  action_item do
    link_to "Esta Ventana", admin_monitor_open_window_path
  end

  content do
    para "Abrir el monitor, en:"
    a link_to "Esta Ventana", admin_monitor_open_window_path
    br
    a link_to "Nueva Ventana", monitor_path, :target => "_blank"
    br
    para "Opciones de configuraci[o]n para el monitor."
  end

end
