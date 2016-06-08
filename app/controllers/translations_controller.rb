class TranslationsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :authenticate_request!

  def index
    load_translations
    load_translations_hash
    render_json(@translations_hash)
  end

  def language
    load_translations
    load_translations_hash
    lang = params[:lang]
    language_hash = {}
    @translations_hash.select { |k, v| k.include? lang }.each { |k, v| language_hash[k.gsub(/#{lang}./, '').to_sym] = v }
    render_json(language_hash)
  end

  def create
    # TODO: Cant use params locale need to use form locale
    I18n.backend.store_translations(params[:locale], { params[:key] => params[:value] }, :escape => false)
    # render_json('Translation added successfully')
  end

  private

  def load_translations
    @translations ||= TRANSLATION_STORE
  end

  def load_translations_hash
    @translations_hash = Hash.new { |h, k| h[k] = '' }
    @translations.keys.each { |key| @translations_hash[key] << @translations[key] }
  end

  def render_json(var)
    render json: var, status: 200
  end
end
