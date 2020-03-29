class ApplicationController < ActionController::API
  
  # Set response template
  def set_response(success = true, message = '', data = nil)
    return {
      'success' => success,
      'message' => message,
      'data' => data
    }
  end

  # Verify post header response
  def post_header(request)
    if request.headers["content-type"] == 'application/json' && request.headers["accept"] == 'application/json'
      true
    else
      false
    end
  end

  # Return post body
  def get_post_body(request)
    JSON.parse request.body.read
  end
end
