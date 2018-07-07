Rails.application.routes.draw do
  get 'static_pages/home'
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'benefits/edit'
  get 'benefits/index'
  get 'benefits/new'
  get 'benefits/show'
  get 'user/new'
  get 'user/edit'
  get 'user/show'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
