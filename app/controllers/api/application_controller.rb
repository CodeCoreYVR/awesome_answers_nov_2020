# Disabling CSRF token Verification - Cross Site Request Frogery

class Api::ApplicationController < ApplicationController
    skip_before_action :verify_authenticity_token
end
