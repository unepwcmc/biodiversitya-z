describe 'Terms' do

  describe 'GET show' do

    it 'displays the given term' do

      # Create a term (including definition, description and multiple sections)
      theme = create(:theme)
      term = create(:term, master_id: theme.id, association_ids: [theme.id])
      term.sections << create(:section)
      term.sections << create(:section)
      term.sections << create(:section)

      # Visit the show URL for this term
      visit refinery.terms_term_path(term)

      # Check for content
      page.should have_content(term.title) # Title
      page.should have_content(term.definition) # Definition
      page.should have_content(term.description) # Description
      page.assert_selector('.js-section-content', :count => 3) # Sections
      page.assert_selector('a.term-section-link', :count => 3) # Contents
      page.should have_css("body.#{term.master_theme.title.parameterize}")

    end

    context 'term with no master theme' do

      context 'logged in' do

        refinery_login_with :refinery_user

        it 'displays an error message' do
          term = create(:term)
          visit refinery.terms_term_path(term)
          page.should have_content(I18n.t(:no_master_theme)) # Warning
        end

      end

    end

  end

end