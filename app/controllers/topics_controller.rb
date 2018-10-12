class TopicsController < ApplicationController

    def index
        @topics = Topic.all
        if @topics
            render json: @topics
        end
    end
end
