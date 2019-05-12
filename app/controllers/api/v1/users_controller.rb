module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      # GET /api/v1/users
      def index
        @users = User.all

        render json: @users
      end

      # GET /api/v1/users/1
      def show
        render json: @user
      end

      # POST /api/v1/users
      def create
        @user = UserService.create(user_params)

        if @user.save
          render json: @user, status: :created, location: api_v1_user_url(@user)
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/1
      def update
        if @user.update(user_params)
          head :no_content
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/1
      def destroy
        @user.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.permit(:name, :email, :cpf)
      end 
    end
  end
end
