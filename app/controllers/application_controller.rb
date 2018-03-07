class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?

    # current_user.locale
    # request.subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]
  end

  def default_url_options(options ={})
    {locale: I18n.locale}
  end
end
