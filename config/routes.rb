Rails.application.routes.draw do
  namespace :api do
    resources :posts
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Catch-all for Angular routing (serve index.html for non-API routes)
  get "*path", to: "static#index", constraints: ->(req) {
    !req.path.start_with?("/api") && !req.path.start_with?("/assets")
  }
  root "static#index"
end
