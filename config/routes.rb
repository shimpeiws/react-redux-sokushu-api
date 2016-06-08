# == Route Map
#
#         Prefix Verb   URI Pattern                                      Controller#Action
# issue_comments POST   /issues/:issue_id/comments(.:format)             issue_comments#create {:format=>:json}
#  issue_comment PATCH  /issues/:issue_id/comments/:comment_id(.:format) issue_comments#update {:format=>:json}
#                PUT    /issues/:issue_id/comments/:comment_id(.:format) issue_comments#update {:format=>:json}
#                DELETE /issues/:issue_id/comments/:comment_id(.:format) issue_comments#destroy {:format=>:json}
#         issues GET    /issues(.:format)                                issues#index {:format=>:json}
#                POST   /issues(.:format)                                issues#create {:format=>:json}
#          issue GET    /issues/:id(.:format)                            issues#show {:format=>:json}
#                PATCH  /issues/:id(.:format)                            issues#update {:format=>:json}
#                PUT    /issues/:id(.:format)                            issues#update {:format=>:json}
#                DELETE /issues/:id(.:format)                            issues#destroy {:format=>:json}
#         labels GET    /labels(.:format)                                labels#index {:format=>:json}
#                POST   /labels(.:format)                                labels#create {:format=>:json}
#          label GET    /labels/:id(.:format)                            labels#show {:format=>:json}
#                PATCH  /labels/:id(.:format)                            labels#update {:format=>:json}
#                PUT    /labels/:id(.:format)                            labels#update {:format=>:json}
#                DELETE /labels/:id(.:format)                            labels#destroy {:format=>:json}
#

Rails.application.routes.draw do
  match "*all" => "application#cors_preflight_check", :constraints => { :method => "OPTIONS" }
  resources :issues, only: [:index, :show, :create, :update, :destroy], defaults: {format: :json} do
    resources :comments,controller: 'issue_comments', param: :comment_id, only: [:create, :update, :destroy]
  end
  resources :labels, defaults: {format: :json}
end
