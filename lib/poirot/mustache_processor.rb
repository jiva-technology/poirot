require 'tilt'

module Poirot
  
  class MustacheProcessor < Tilt::Template
    
    JS_ESCAPE_MAP = {
            '\\'    => '\\\\',
            '</'    => '<\/',
            "\r\n"  => '\n',
            "\n"    => '\n',
            "\r"    => '\n',
            '"'     => '\\"',
            "'"     => "\\'" }
    
    def self.default_mime_type
      'application/javascript'
    end
    
    def prepare
    end
    
    def evaluate(scope, locals, &block)
      template_name = scope.logical_path
      <<-POIROT
(function() {
  if(!MustacheTemplates){ MustacheTemplates = {}; }
  MustacheTemplates['#{template_name}'] = '#{escape_javascript(data)';
})();
      POIROT
    end
    
    def escape_javascript(javascript)
      if javascript
        javascript.strip.gsub(/(\\|<\/|\r\n|[\n\r"'])/) {|match| JS_ESCAPE_MAP[match] }
      else
        ''
      end
    end
    
  end  
  
end