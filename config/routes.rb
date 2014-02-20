Timekeeper::Application.routes.draw do
  
  resources :timelogs, :collection => { :logout => :put, :login => :put, :lognonwork => :put, :logtoil => :put }
  match "/login" => "timelogs#login", via: [:get, :post]
  match "/logout" => "timelogs#logout", via: [:get, :post]
  match "/logtoil" => "timelogs#logtoil", via: [:get, :post]
  match "/lognonwork" => "timelogs#lognonwork", via: [:get, :post]
  root :to => 'timelogs#index'

end
