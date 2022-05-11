Rails.application.routes.draw do

  scope "(:locale)", locale: /en|pl/ do

    resources :aus_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :hesc_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :ndin_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :ispc_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :mnc_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :nds_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :ndsi_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :nrnp_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :nspc_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :plmn_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :pstn_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :voip_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :prm_tables, only: [:index] do
      get 'export', on: :collection
    end
    resources :m2m_tables, only: [:index] do
      get 'export', on: :collection
    end

    get 'datatables/lang'
    get 'static_pages/home'
    get 'static_pages/declaration'

    root to: 'static_pages#home'
	end

end
