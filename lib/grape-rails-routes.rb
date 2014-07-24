class GrapeRailsRoutes < Rails::Railtie
  rake_tasks do
    Dir[File.join(File.dirname(__FILE__), 'rails/tasks/*.rake')].each { |f| load f }
  end
  
  initializer 'GrapeRailsRoutes.initializer' do
    require File.join(File.dirname(__FILE__), 'rails/info_controller')

    Rails.application.routes.append do
      get '/rails/info/routes_with_grape' => 'rails/info#routes_with_grape'
    end
  end
end
