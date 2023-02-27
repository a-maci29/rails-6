module SessionsHelper
    ###Logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end

    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end

    def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    end

    ##Returns the current logged in user (if any)
    ## If the user exists and the session is valid, returns the user as @current_user, if not, returns nil


    # def current_user
    #     return nil unless session[:user_id].present?
    #     @current_user ||= User.find_by(id: session[:user_id])
    # end

    def current_user
         if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
         elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    ##Returns true if the user is logged in, false otherwise

    def logged_in?
        current_user.present?
    end

    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def log_out
    forget(current_user)
    reset_session
    @current_user = nil
    end
end
