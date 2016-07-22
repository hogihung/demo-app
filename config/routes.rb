class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present? && !EXCLUDED_SUBDOMAINS.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  constraints(SubdomainPresent) do
    devise_for :users
  end

  root to: "welcome#index"
  resources :accounts

  get '*unmatched_route', to: 'application#raise_not_found'
end
