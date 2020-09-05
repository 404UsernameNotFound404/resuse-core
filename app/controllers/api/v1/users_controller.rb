module Api
    module V1
        class UsersController < ApplicationController
            def index
                users = User.order('created_at DESC');
                render json: {status: "SUCCESS", message: "loaded users", data: users},status: :ok
            end
            
            def show
                user = User.find(params[:id]);
                render json: {status: "SUCCESS", message: "loaded user", data: user},status: :ok
            end

            def create
                user = User.new(user_params);
                if user.save 
                    render json: {status: "SUCCESS", message: "saved user", data: user},status: :ok
                else
                    render json: {status: "ERROR", message: "user not saved", data: user.errors},status: :unprocessable_entity
                end
            end

            def destroy
                user = User.find(params[:id])
                user.destroy
                render json: {status: "SUCCESS", message: "deleted user", data: user},status: :ok
            end

            def update
                user = User.find(params[:id]);
                if user.update_attributes(user_params)
                    render json: {status: "SUCCESS", message: "updated user", data: user},status: :ok
                else
                    render json: {status: "ERROR", message: "user not updated", data: user.errors},status: :unprocessable_entity
                end
            end

            def user_params
                params.permit(:name, :password)
            end
        end
    end
end