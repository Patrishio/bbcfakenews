Rails.application.routes.draw do  
  
  root 'static_pages#home'
  get  'static_pages/vote_action'

  namespace :api, {format: :json} do
    get 'feeds/update_xml'
  end

end
