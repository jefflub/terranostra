module Api::V1
    class SessionsController < ApplicationController
        skip_before_action :authenticate

        def create
            user = User.find_by(email: auth_params[:email])
            if user.present? && user.authenticate(auth_params[:password])
                jwt = Auth.issue({user: user.id})
                render json: {jwt: jwt}
            else
                render json: {user: ["not found or invalid password"]}, status: :unprocessable_entity
            end
        end

        private

            def auth_params
                params.require(:auth).permit(:email, :password)
            end
    end
end