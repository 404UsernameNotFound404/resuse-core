module Api
    module V1
        class BussinessController < ApplicationController
            def index
                bussinesses = Bussiness.order('created_at DESC');
                render json: {status: "SUCCESS", message: "loaded bussinesses", data: bussinesses},status: :ok
            end
            
            def show
                bussiness = Bussiness.find(params[:id]);
                render json: {status: "SUCCESS", message: "loaded bussiness", data: bussiness},status: :ok
            end

            def create
                bussiness = Bussiness.new(bussiness_params);
                if bussiness.save 
                    render json: {status: "SUCCESS", message: "saved bussiness", data: bussiness},status: :ok
                else
                    render json: {status: "ERROR", message: "bussiness not saved", data: bussiness.errors},status: :unprocessable_entity
                end
            end

            def destroy
                business = Bussiness.find(params[:id])
                business.destroy
                render json: {status: "SUCCESS", message: "deleted business", data: business},status: :ok
            end

            def update
                bussiness = Bussiness.find(params[:id]);
                if bussiness.update_attributes(bussiness_params)
                    render json: {status: "SUCCESS", message: "updated bussiness", data: bussiness},status: :ok
                else
                    render json: {status: "ERROR", message: "bussiness not updated", data: bussiness.errors},status: :unprocessable_entity
                end
            end

            def bussiness_params
                params.permit(:name, :password)
            end
        end
    end
end