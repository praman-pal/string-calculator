Rails.application.routes.draw do
  root "string_calculator#index"

  post "/add", to: "string_calculator#add"
  get "/result", to: "string_calculator#result"
end
