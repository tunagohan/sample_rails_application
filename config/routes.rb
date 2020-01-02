Rails.application.routes.draw do
  root to: 'page#home'
  get "/api/v1/books", to: 'page#books', format: 'json'
end
