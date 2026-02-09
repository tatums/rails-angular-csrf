class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception
  after_action :set_csrf_cookie

  private

  def set_csrf_cookie
    cookies["XSRF-TOKEN"] = {
      value: form_authenticity_token,
      same_site: :strict
    }
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers["X-XSRF-TOKEN"])
  end
end
