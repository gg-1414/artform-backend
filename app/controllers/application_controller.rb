class ApplicationController < ActionController::API
  def issue_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token(payload)
    JWT.decode(payload, 'secret')
  end
end
