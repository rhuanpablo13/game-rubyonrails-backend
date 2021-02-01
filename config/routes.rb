Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
  	namespace 'v1' do
  		resources :users
  	end
  end

  namespace 'api' do
  	namespace 'v1' do
  		resources :monster
  	end
  end

  namespace 'api' do
	namespace 'v1' do
		resources :collected_coin
	end
  end

  namespace 'api' do
	namespace 'v1' do
		resources :death
	end
  end

  namespace 'api' do
	namespace 'v1' do
		resources :killed_monster
	end
  end
end
