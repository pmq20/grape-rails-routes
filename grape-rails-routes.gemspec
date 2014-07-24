# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'grape-rails-routes'
  s.version = '1.0'

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["P.S.V.R"]
  s.date = `git log --pretty="%ai" -n 1`.split(" ").first
  s.description = "After you mount Grape API routes into Rails, Grape API routes would normally not be printed via `rake routes` or `/rails/info/routes`. This gem adds routes printing for Grape with Rails."
  s.email = ['pmq2001@gmail.com']
  s.executables = []
  s.extensions = []
  s.files = `git ls-files`.split($/)
  s.homepage = "https://github.com/pmq20/grape-rails-routes"
  s.license = "MIT"
  s.rdoc_options = []
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "1.8.25"
  s.summary = "After you mount Grape API routes into Rails, Grape API routes would normally not be printed via `rake routes` or `/rails/info/routes`. This gem adds routes printing for Grape with Rails."

  s.add_dependency('rails', [">= 4.1.4"])
end