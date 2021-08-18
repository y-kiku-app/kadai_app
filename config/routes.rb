Rails.application.routes.draw do

  # root "mypage/show"
  get 'mypage/show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
    post 'users/sign_up/confirm', to: 'users/registrations#confirm'
    get 'users/sign_up/complete', to: 'users/registrations#complete'
  end

  resources :mypage, only: [:show]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
