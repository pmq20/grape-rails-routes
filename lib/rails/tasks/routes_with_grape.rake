desc 'Print out all defined routes, with grape routes, in match order, with names. Target specific controller with CONTROLLER=x.'
task routes_with_grape: :environment do
  all_routes = Rails.application.routes.routes
  grape_klasses = ObjectSpace.each_object(Class).select { |klass| klass < Grape::API }
  app = all_routes.first.app
  grape_klasses.each do |klass|
    klass.compile
    klass.routes.each do |route|
      path = ActionDispatch::Journey::Path::Pattern.new route.route_path
      all_routes.add_route(klass, path, {
        request_method: %r{^#{route.route_method}$}
      }, {}, route.route_description)
    end
  end
  require 'action_dispatch/routing/inspector'
  inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
  puts inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, ENV['CONTROLLER'])
end
