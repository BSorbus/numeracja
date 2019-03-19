Rails.application.routes.draw do

  scope "(:locale)", locale: /en|pl/ do

    resources :aus_tables, only: [:index, :show]
    resources :hesc_tables, only: [:index, :show]
    resources :in_tables, only: [:index, :show]
    resources :ispc_tables, only: [:index, :show]
    resources :mnc_tables, only: [:index, :show]
    resources :nds_tables, only: [:index, :show]
    resources :ndsi_tables, only: [:index, :show]
    resources :nrnp_tables, only: [:index, :show]
    resources :nspc_tables, only: [:index, :show]
    resources :plmn_tables, only: [:index, :show]
    resources :pstn_tables, only: [:index, :show]
    resources :voip_tables, only: [:index, :show]


    resources :individuals, only: [:index, :show] do
      get 'export', on: :collection
    end

    resources :clubs, only: [:index, :show] do
      get 'export', on: :collection
    end

    resources :individual_devices, only: [:index, :show] do
      get 'export', on: :collection
    end

    resources :club_devices, only: [:index, :show] do
      get 'export', on: :collection
    end

    get 'datatables/lang'

	  get 'static_pages/home'
    root to: 'static_pages#home'
	end

end
