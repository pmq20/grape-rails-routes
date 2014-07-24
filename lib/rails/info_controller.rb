require 'rails/info_controller'

class Rails::InfoController < Rails::ApplicationController # :nodoc:
  prepend_view_path ActionDispatch::DebugExceptions::RESCUES_TEMPLATE_PATH
  prepend_view_path File.expand_path('../../../app/views', __FILE__)

  def routes_with_grape
    all_routes = _routes.routes
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

    @routes_inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    @page_title = 'Routes with grape'
    render layout: 'grape-rails-routes'
  end
end
