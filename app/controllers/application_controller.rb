class ApplicationController < ActionController::Base
  before_filter :build_page_nav, :build_jumbotron_blocks, :build_blocks
  protect_from_forgery with: :exception

  def build_page_nav
    @page_nav = Page.where(menu_display: true, is_published: true).order(order: :asc)
  end

  def build_jumbotron_blocks
    @jumbotron = Block.where(position: 'block')
  end

  def build_blocks
    @blocks = Block.where(position: 'block').order(order: :asc)
  end
end
