require 'tilt'

module Poirot
  
  class MustacheProcessor < Tilt::Template
    
    def self.default_mime_type
      'application/javascript'
    end
    
    def prepare
    end
    
    def evaluate(scope, locals, &block)
      template_name = scope.logical_path
      <<-POIROT
(function() {
  this.MustacheTemplates || (this.MustacheTemplates = {});
  this.MustacheTemplate["#{template_name}"] = "#{data.strip}";
}).call(this);
      POIROT
    end
    
  end  
  
end