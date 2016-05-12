module ApplicationHelper

  def output_term_associations(themes)
    render partial: 'theme', collection: themes, as: 'theme'
  end

  def parse_for_citations(text)
    text.to_s.gsub(/\[(\d+)\]/, '<sup>&nbsp;<a href="#citation-\1">\1</a></sup>')
  end

  def background_image(image, dimensions=nil)
    return unless image
    if dimensions
      image.thumbnail(dimensions).url
    else
      image.url
    end
  end

  def logo_url(url)
    url = url.to_s
    if url.starts_with?('logo-main')
      url = asset_path(url)
    end
    url
  end

  def link_to_term(term, theme)
    if term.acronym_id.present? && theme.title.downcase != 'acronyms'
      link_to term.title, refinery.terms_term_path(term.parent_term)
    else
      link_to term.title, refinery.terms_term_path(term)
    end
  end

  def no_master_theme_warning
    content_tag :p, t(:no_master_theme), style: 'color: red; font-weight: bold;'
  end

  def term_preview_image(term)
    image = term.featured_image.presence || term.parent_term.try(:featured_image).presence
    image_fu(image, '135x135#')
  end

end
