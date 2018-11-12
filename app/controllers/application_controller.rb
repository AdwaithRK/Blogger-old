class ApplicationController < ActionController::Base

before_action :set_cache_buster

def set_cache_buster
   response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
   response.headers["Pragma"] = "no-cache"
   response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
end



    protected
      def after_sign_in_path_for(resource)
        '/signup'
      end
 
    # protected
    # def after_sign_in_path_for(resource)
    #   # if(!user_signed_in?)
    #   #   '/login'
    #   '/signup'
    # end

end
