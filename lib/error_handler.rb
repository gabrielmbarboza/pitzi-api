module ErrorHandler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    end
  end

  private
  
  def record_not_found(e)
    status = 404
    render_error(:not_found, status, e.to_s)
  end

  def record_invalid(e)
    status = 422
    render_error(:record_invalid, status, e.to_s)
  end

  def render_error(error, status, message)
    json = json(error, status, message)

    render json: json, status: status
  end

  def json(error, status, message) 
    {
      status: status,
      error: error,
      message: message
    }.as_json
  end
end