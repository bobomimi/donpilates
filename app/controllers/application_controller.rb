class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
    #I18n.locale = http_accept_language.preferred_language_from(I18n.available_locales)
    #I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    # current_user.locale
    # request.subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]
  end

  def default_url_options(options ={})
    {locale: I18n.locale}
  end
end
