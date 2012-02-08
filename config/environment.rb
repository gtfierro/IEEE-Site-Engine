# Load the rails application
require File.expand_path('../application', __FILE__)

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance| 
  if html_tag =~ /<label/
    %|<div class="fieldWithErrors">#{html_tag} <span class="error">#{[instance.error_message].join(', ')}</span></div>|.html_safe
  else
    html_tag
  end
end

Haml::Template.options[:ugly] = true

# Initialize the rails application
Ieee::Application.initialize!
