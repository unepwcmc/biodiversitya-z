class Processor

  def process(string)
    string.to_s.strip!
    unless string.nil? or string.starts_with?('<p>') or string.ends_with?('</p>')
      string = '<p>' + string + '</p>'
    end
    string
  end

end