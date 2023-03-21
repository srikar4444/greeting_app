class Web::ApiController < ActionController::API

  def current_user
    if user_id > 0
      @current_user || = User.find(user_id)
    else
      @current_user = nil
    end
  end

    private
      def user_id
        request.headers['HTTP_USER_ID'].to_i
      end
  end