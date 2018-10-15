class ApplicationController < ActionController::API
    include JSONErrors
    include ActionController::MimeResponds
    respond_to :json
end
