module ThemesHelper

  def options_for_theme_select
    options_for_select(Refinery::Terms::Theme.themes.order(:title).collect { |t| [t.title, t.id] }, params[:theme_id])
  end

  def output_themes_with_current_theme(themes, current_theme)
    themes.collect do |theme|
      css_classes = "#{theme.title.parameterize} #{current_theme.id == theme.id ? 'active' : ''}"
      link_to theme.title, refinery.terms_theme_path(theme), class: css_classes
    end.join("\n").html_safe
  end

  def output_themes_for_term(themes, term)
    themes.collect do |theme|
      css_classes = "#{theme.title.parameterize} #{term.themes.include?(theme) ? 'active' : ''}"
      link_to theme.title, refinery.terms_theme_url(theme, s:'terms-page'), class: css_classes
    end.join("\n").html_safe
  end

  def output_themes_for_homepage(themes)
    themes.collect do |theme|
      content_tag :li, class: theme.title.downcase do
        link_to refinery.terms_theme_path(theme, s:'home-icons') do
          content_tag :figure, style: "background-image: url(#{background_image(theme.icon, nil)})" do
            content_tag :h3, theme.title
          end
        end
      end
    end.join("\n").html_safe
  end

  def options_for_theme_category_select(theme, preselected=nil)
    children = [['All categories', nil]]
    theme.children.each do |category|
      children << ["#{category.title} (#{category.terms_count})", category.id]
      category.children.each do |subcategory|
        children << ["- #{subcategory.title} (#{subcategory.terms_count})", subcategory.id]
      end
    end
    options_for_select(children, preselected)
  end

end
