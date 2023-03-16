class ApplicationController < ActionController::API

    def authenticate_request
        token = User.find_by(token: params[:token])
        if token.nil? 
          render json: {error: "User not found"}, status: 404
        elsif !token.logged_in
            render json: { error: "Please login"}, status: :unauthorized
        elsif token.expire_at < Time.now
          render json: { error: "Session Expired" }, status: :unauthorized
        end
    end
end
