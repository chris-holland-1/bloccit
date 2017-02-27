Rails.application.routes.draw do
  resources :sponsored_posts do
    resources :topics
  end

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root 'welcome#index'
end
