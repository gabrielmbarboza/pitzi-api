module UserService
  class << self
    def create(params)
      User.create(params)
    end
  end
end