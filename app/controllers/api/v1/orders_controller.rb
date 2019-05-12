module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_user
      before_action :set_order, only: %i[show update destroy]

      # GET /api/v1/users/1/orders
      def index
        @orders = @user&.orders

        render json: @orders
      end

      # GET /api/v1/users/1/orders/1
      def show
        render json: @order
      end

      # POST /api/v1/users/1/orders
      def create
        @order = OrderService.create(order_params)

        if @order.errors.any?
          render json: @order.errors, status: :unprocessable_entity
        else
          render json: @order, status: :created, location: api_v1_user_order_url(@user, @order)
        end
      end

      # PATCH/PUT /api/v1/users/1/orders/1
      def update
        if @order.update(order_params)
          head :no_content
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/1/orders/1
      def destroy
        @order.destroy
      end

      private

      # Only allow a trusted parameter "white list" through.
      def order_params
        params.permit(:device_model, :device_imei, :annual_price, :installments, :user_id)
      end

      def set_user
        @user = User.find(order_params[:user_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end
    end
  end
end
