class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :set_logo
  before_filter :set_themes
  before_filter :set_about
  before_filter :set_footer_items

  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActiveRecord::RecordNotFound, with: :routing_error
  add_breadcrumb "Home", "/"


  def routing_error
    if url = RedirectHandler.new(request.fullpath).redirection_url
      redirect_to url, :status => :moved_permanently and return
    end
    raise ActionController::RoutingError.new(params[:path])
  end

  protected

  def render_404
    respond_to do |type|
      type.html { render :status => :not_found, :action => :not_found, :formats => [:html] }
      type.all  { render :status => :not_found, :nothing => true }
    end
  end

  def set_logo
    @logo = 'logo-main.jpg'
  end

  def set_themes
    @themes = Refinery::Terms::Theme.themes.order(:title)
  end

  def set_about
    @about = ::Refinery::Page.where(:slug => "about").first
  end

  def set_footer_items
    @footer_items = ::Refinery::Page.where(show_in_footer: true).order('lft ASC')
  end

end
