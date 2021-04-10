class ApplicationController < ActionController::Base
use OmniAuth::Builder do
  provider :gumroad, ENV['GUMROAD_APPLICATION_ID'], ENV['GUMROAD_APP_SECRET']
end

end
