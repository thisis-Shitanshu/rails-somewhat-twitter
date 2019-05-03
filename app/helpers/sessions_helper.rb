module SessionsHelper
    
=begin
    - Temporary cookies created using the session method are automatically encrypted, the code is secure.
    - It is not the case for persistent sessions created using the cookies method.
        - Permanent cookies are vulnerable to a session hijacking attack.
        - So be more careful about the information we place on the user’s browser.
=end

    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the current Logged-in user (if any)
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # Returns true if the user is logged in, false otherwise
    def logged_in?
        !current_user.nil?
    end

    # Logs out the current user.
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
