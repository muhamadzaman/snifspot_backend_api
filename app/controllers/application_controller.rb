class ApplicationController < ActionController::Base
    before_action :allow_all_requests
    private 

    def allow_all_requests
        headers['Access-Control-Allow-Origin'] = '*'    
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end
