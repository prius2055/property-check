class Api::V1::UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = Property.new(user_params)
        if @user.save
            render json: { status: 'Success', message: 'User created successfully' }, status: :created
        else
            render json: { errors:@user.errors.full_messages }, status: :unprocessable_entity
        end
    end
end

    