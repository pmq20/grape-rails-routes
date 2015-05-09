module RoutesWithGrape

  def append_grape_to(rails_routes)
    all_routes = rails_routes.routes
    grape_klasses = ObjectSpace.each_object(Class).select { |klass| klass < Grape::API }
    app = all_routes.first.app
    grape_klasses.each do |klass|
      klass.compile
      klass.routes.each do |route|
        # Rails 4.2+
        if ActionDispatch::Journey::Path::Pattern.respond_to?(:from_string)
          path = ActionDispatch::Journey::Path::Pattern.from_string route.route_path
          all_routes.add_route(app, path, {
            request_method: %r{^#{route.route_method}$}
          }, {}, route.route_description)
        else
          path = ActionDispatch::Journey::Path::Pattern.new route.route_path
          all_routes.add_route(klass, path, {
            request_method: %r{^#{route.route_method}$}
          }, {}, route.route_description)
        end
      end
    end
    all_routes
  end

end
