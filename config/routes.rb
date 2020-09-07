Rails.application.routes.draw do
	devise_for :users
	resources :users, only: [:show, :edit, :update]
	resources :recipes, only: [:new, :create, :index, :show, :update, :edit] do
		resource :favorites, only: [:create, :destroy]
		resources :post_comments, only: [:create, :destroy]
	end
	get "genres/:id" => "genres#show", as: "genre"
	#indexページは部分テンプレートのsidebarと同じ役割なので、showページのみ残しました。
	root 'homes#top'
	get 'about' => 'homes#about'
end
