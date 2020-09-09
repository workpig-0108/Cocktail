Rails.application.routes.draw do
	devise_for :users
	resources :users, only: [:show, :edit, :update]
	resources :recipes, only: [:new, :create, :index, :show, :update, :edit] do
		resource :favorites, only: [:create, :destroy]
		resources :post_comments, only: [:create, :destroy]
	end
	root 'homes#top'
	get 'about' => 'homes#about'
end
