module LettersHelper

  # Use anchors for live links and spans for inactive links
  def output_letters_for_theme(letters)
    letters.collect do |letter|
      content_tag :li do
        if letter.terms?
          link_to letter.letter, "#letter-#{letter.letter}", :class => "js-smooth-scroll"
        else
          content_tag :span, letter.letter
        end
      end
    end.join("\n").html_safe
  end

end