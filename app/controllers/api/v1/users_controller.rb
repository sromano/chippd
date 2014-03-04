module Api
  module V1
    class UsersController < ApplicationController
        wrap_parameters :user, include: [:name, :email, :password, :password_confirmation]
        respond_to :json

        def create
          @user = User.create(user_params)
          if @user.save
            render :json => @user
          else
            render :json => { :errors => @user.errors.full_messages }, :status => :unprocessable_entity
          end
        end

        private
        def user_params
            params.permit(:name, :email, :password, :password_confirmation)
        end
    end
  end
end
