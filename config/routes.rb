ActionController::Routing::Routes.draw do |map|
  map.resources :timelogs, :collection => { :logout => :put, :login => :put, :lognonwork => :put, :logtoil => :put }    
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.root :controller=>'sessions' , :action =>'new'
end
