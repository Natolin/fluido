class AuthsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  rescue_from StandardError,     with: :internal_server_error

  def token
  # put your own credentials here
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    # auth_token = ENV["TWILIO_API_KEY"]
    api_key = ENV["TWILIO_API_KEY"]
    api_secret = ENV["TWILIO_API_SECRET"]

    # Create an Access Token
    identity = "user-#{rand(1000)}"
    # Create Video grant for our token
    video_grant = Twilio::JWT::AccessToken::VideoGrant.new
    video_grant.room = 'cool room'
    # Create an Access Token
    @token = Twilio::JWT::AccessToken.new(
      account_sid,
      api_key,
      api_secret,
      [video_grant],
      identity: identity
    )

    # Generate the token
    render json: {identity: identity, token: @token.to_jwt}, status: 200
  end

  # "{'identity': 'whatever'}"
  # HTTP => hyper TEXT transfer protocol

  private

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, message: exception.message, backtrace: exception.backtrace }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end

end
