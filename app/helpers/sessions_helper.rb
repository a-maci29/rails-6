module SessionsHelper
    ###Logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end

    ##Returns the current logged in user (if any)
    ## If the user exists and the session is valid, returns the user as @current_user, if not, returns nil
    def current_user
        return nil unless session[:user_id].present?

        @current_user ||= User.find_by(id: session[:user_id])
    end

    ##Returns true if the user is logged in, false otherwise

    def logged_in?
        current_user.present?
    end

    def log_out
    reset_session
    @current_user = nil
    end
end
