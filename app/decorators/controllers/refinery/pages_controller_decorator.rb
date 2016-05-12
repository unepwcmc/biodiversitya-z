Refinery::PagesController.class_eval do

  before_filter :set_themes
  before_filter :find_biodiversity_term, only: [:home]

  protected

  def set_themes
    @themes = Refinery::Terms::Theme.themes.order(:title)
  end

  def find_biodiversity_term
    @biodiversity = Refinery::Terms::Term.find_by_slug('biodiversity')
  end

end