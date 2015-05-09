require 'rails/routes_with_grape'

class Rails::InfoController < Rails::ApplicationController # :nodoc:
  prepend_view_path ActionDispatch::DebugExceptions::RESCUES_TEMPLATE_PATH
  prepend_view_path File.expand_path('../../../app/views', __FILE__)

  include RoutesWithGrape

  def routes_with_grape
    rails_routes = append_grape_to(_routes)
    @routes_inspector = ActionDispatch::Routing::RoutesInspector.new(rails_routes)
    @page_title = 'Routes with grape'
    render layout: 'grape-rails-routes'
  end
end
