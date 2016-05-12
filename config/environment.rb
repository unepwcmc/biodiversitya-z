# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Biodiversity::Application.initialize!

# Add custom datetime format for term updated at
Time::DATE_FORMATS[:updated_at] = "%e %B %Y"