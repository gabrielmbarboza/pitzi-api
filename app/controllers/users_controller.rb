class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    json_response(@users)
  end

  # GET /users/1
  def show
    json_response(@users)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    ijson_response(@users, :created)
  end

  # PATCH/PUT /users/1
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :cpf)
    end
end