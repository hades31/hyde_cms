class ApplicationController < ActionController::Base
  before_filter :build_page_nav
  protect_from_forgery with: :exception

  def build_page_nav
    @page_nav = Page.where(menu_display: true, is_published: true).order(order: :asc)
  end
end
