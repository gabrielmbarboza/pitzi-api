module OrderService
  class << self
    def create(params)
      @user = User.find(params['user_id'])
      @user.orders.create(params)
    end
  end
end