class Api::V1::HelpRequestsController < ApiController
  def create
    @help_request = HelpRequest.new help_request_params
    if current_user
      @help_request.update(user_id: current_user)
    elsif User.first
      user = User.first
      @help_request.update(user_id: user.id)
    end
    if @help_request.save
      render json: {message: 'Thank you for your message'}
    else
      render json: {message: @help_request.errors.full_messages}, status: 400
    end
  end

private
  def help_request_params
    params.permit(:title, :message, :urgent, :user)
  end
end
