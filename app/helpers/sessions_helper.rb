module SessionsHelper

    def sing_in(user)
        session[:user_id] = user.id
    end

    def sing_out
        session.delete(:user_id)
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def user_signed_in?
        !current_user.nil?
    end
end
