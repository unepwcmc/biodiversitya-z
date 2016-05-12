module Refinery
  module Terms
    module Admin
      describe TermsController, type: :controller do

        refinery_login_with :refinery_user

        describe 'PUT update' do

          context 'with valid attributes' do

            it 'sets the master theme' do
              @term = create(:term)

              t1 = create(:theme)
              t2 = create(:theme)
              t3 = create(:theme)

              put :update, use_route: :refinery, id: @term, term: attributes_for(:term, master_id: t2.id, association_ids: [t1.id, t2.id, t3.id])
              @term.reload.master_theme.should eq(t2)
            end

          end
        end

        describe 'POST create' do

          context 'with valid attributes' do

            it 'creates a new term' do
              expect {
                post :create, use_route: :refinery, term: attributes_for(:term)
              }.to change(Term, :count).by(1)
            end

            it 'sets the master theme' do
              t1 = create(:theme)
              t2 = create(:theme)
              t3 = create(:theme)

              post :create, use_route: :refinery, term: attributes_for(:term, master_id: t2.id, association_ids: [t1.id, t2.id, t3.id])
              Term.last.master_theme.should eq(t2)
            end

          end
        end

      end
    end
  end
end