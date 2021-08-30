Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # root "mypage/show"
  get 'mypage/show'
  get 'mypage/logout'
  get 'admin_user_dashboards/index'

  devise_for :admin_users, controllers: {
    sessions: "admin_users/sessions"
  }
  namespace :admin_users do
    get 'admins/sign_in' => 'admin/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admin/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admin/sessions#destroy', as: 'destroy_admin_session'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: "users/passwords"
  }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
    post 'users/sign_up/confirm', to: 'users/registrations#confirm'
    get 'users/sign_up/complete', to: 'users/registrations#complete'
    get 'users/sign_up/cancellation', to: 'users/registrations#cancellation'
  end

  resources :mypage, only: [:show,:logout]
  resources :admin_user_dashboards, only: [:index]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
