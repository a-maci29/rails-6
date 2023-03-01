class ApplicationController < ActionController::Base
    include SessionsHelper

default_form_builder TestBuilder

    before_action :require_login

    # def require_login
    #     binding.pry
    #     puts "hello, checking login status: #{logged_in?}"
    #    if logged_in?
    #         true
    #     else
    #         redirect_to signup_path
    #     end
    # end



    # Example from rails docs

####class ApplicationController < ActionController::Base
#     before_action :require_login
  
    private
  
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_url # halts request cycle
      end
    end
end



  