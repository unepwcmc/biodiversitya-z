# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Terms" do
    describe "Admin" do
      describe "themes" do
        refinery_login_with :refinery_user

        describe "themes list" do
          before do
            FactoryGirl.create(:theme, :title => "UniqueTitleOne")
            FactoryGirl.create(:theme, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.terms_admin_themes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.terms_admin_themes_path

            click_link "Add New Theme"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Terms::Theme.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Terms::Theme.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:theme, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.terms_admin_themes_path

              click_link "Add New Theme"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Terms::Theme.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:theme, :title => "A title") }

          it "should succeed" do
            visit refinery.terms_admin_themes_path

            within ".actions" do
              click_link "Edit this theme"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:theme, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.terms_admin_themes_path

            click_link "Remove this theme forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Terms::Theme.count.should == 0
          end
        end

      end
    end
  end
end
