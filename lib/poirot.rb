require 'mustache'
require 'poirot/handler'
require 'poirot/view'
require 'poirot/view_helpers'
require 'poirot/mustache_processor'

ActionView::Template.register_template_handler(:mustache, Poirot::Handler)

module Poirot
    
  class Engine < ::Rails::Engine
    directory = "app/mustaches"
    
    # Add app/mustaches to the view path
    # So that mustaches can be rendered from Rails
    initializer "poirot.views", :before => :add_view_paths do |app|
      app.paths["app/views"] << directory
    end
    
    # Add app/mustaches to the assets paths
    # So that mustaches can be rendered from Sprockets
    initializer "poirot.assets" do |app|
      app.config.assets.paths.unshift Rails.root.join( directory )
    end
    
    # Add the Poirot view helpers
    # So we can access Poirot methods from views
    initializer "poirot.view_helpers" do |app|
      ActiveSupport.on_load(:action_view) do
        include ::Poirot::ViewHelpers
      end
    end
    
    # Add mustache handler to sprockets
    # So that mustaches are turned into Javascript
    initializer "poirot.sprockets", :after => "sprockets.environment" do |app|
      next unless app.assets
      app.assets.register_engine('.mustache', Poirot::MustacheProcessor)
    end
    
  end

end