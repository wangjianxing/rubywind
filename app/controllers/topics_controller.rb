class TopicsController < ApplicationController
    before_action :authenticate_user!

    def index
        @topics = Topic.all
        if @topics
            render json: @topics
        end
    end
end
