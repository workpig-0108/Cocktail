Rails.application.routes.draw do
	get 'top' => 'homes#top'
	get 'about' => 'homes#about'
	devise_for :users
	root 'recipes#index'
	resources :recipes, only: [:new, :create, :index, :show, :update, :edit]
	get "genres/:id" => "genres#show", as: "genre"
	#indexページは部分テンプレートのsidebarと同じ役割なので、showページのみ残しました。
end
