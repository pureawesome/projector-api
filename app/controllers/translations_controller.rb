class TranslationsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :authenticate_request!

  def index
    @translations = TRANSLATION_STORE
    @translations_hash = Hash.new { |h, k| h[k] = '' }
    @translations.keys.each { |key| @translations_hash[key] << @translations[key] }
    render_json(@translations_hash)
  end

  def create
    # TODO: Cant use params locale need to use form locale
    I18n.backend.store_translations(params[:locale], { params[:key] => params[:value] }, :escape => false)
    # render_json('Translation added successfully')
  end

  private
  def render_json(var)
    render json: var, status: 200
  end
end
