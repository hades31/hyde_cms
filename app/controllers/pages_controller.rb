class PagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    redirect_to root_path, alert: "This page does not exist"
  end

  def show
    @page = Page.find(params[:id])
    unless @page.is_published?
      record_not_found
    end
    @sections = Section.all
  end
end
