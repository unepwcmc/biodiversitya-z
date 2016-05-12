Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :terms, :path => '' do
    resources :themes, :only => [:show]
  end

  # Admin routes
  namespace :terms, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/terms" do
      resources :themes, :except => :show do
        collection do
          post :update_positions
        end
        member do
          get :children
        end
      end
    end
  end

  # Frontend routes
  namespace :terms, :path => 'content' do
    resources :terms, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :terms, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :terms, :except => :show do
        collection do
          post :update_positions
          get :search
          get :mass_edit
          post :mass_save
        end
      end
    end
  end

  #get '/t/*id', :to => 'terms#show'

end
