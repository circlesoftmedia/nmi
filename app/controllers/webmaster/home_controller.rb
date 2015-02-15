class Webmaster::HomeController < ApplicationController
  before_filter :authenticate_admin!
  load_and_authorize_resource
  layout 'webmaster'
  def index
  end
end
