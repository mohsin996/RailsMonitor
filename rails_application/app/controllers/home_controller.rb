class HomeController < ApplicationController
  def index
  end
end

# Test HTTP 500 
# class HomeController < ApplicationController
#   def index
#     raise "This is a test error for HTTP 500"
#   end
# end
