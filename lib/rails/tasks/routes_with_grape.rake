desc 'Print out all defined routes, with grape routes, in match order, with names. Target specific controller with CONTROLLER=x.'
task routes_with_grape: :environment do
  require 'action_dispatch/routing/inspector'
  require 'rails/routes_with_grape'
  include RoutesWithGrape
  inspector = ActionDispatch::Routing::RoutesInspector.new(append_grape_to(Rails.application.routes))
  puts inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, ENV['CONTROLLER'])
end
