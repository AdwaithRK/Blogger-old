Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/distroy'
  get 'feed/show'
  get 'comments/show_post_comments'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect('/login')
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  devise_scope :user do
    get 'signup' => 'users#signup'
  end

  resources :users do
    member do
      put '/admin' => 'users#make_admin', as: :make_admin
    end
  end
end