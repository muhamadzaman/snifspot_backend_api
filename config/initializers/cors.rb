Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # You can replace * with your frontend domain
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
end