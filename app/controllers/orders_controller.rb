class OrdersController < ApplicationController
  before_action :set_user
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /users/1/orders
  def index
    @orders = @user&.orders

    render json: @orders
  end

  # GET /users/1/orders/1
  def show
    render json: @order
  end

  # POST /users/1/orders
  def create
    @order = @user.orders.create!(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1/orders/1
  def update
    if @order.update(order_params)
      head :no_content
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1/orders/1
  def destroy
    @order.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def order_params
      params.permit(:device_model, :device_imei, :annual_price, :installments)
    end
  
    def set_user
      @user = User.where(id: params[:user_id]).first
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.where(id: params[:id], user_id: params['user_id']).first if @user
    end
end