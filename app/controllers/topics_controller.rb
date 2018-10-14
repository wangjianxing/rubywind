class TopicsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :update, :destroy]
    before_action :find_my_topic, only: [:update, :destroy]

    def index
      @topics = Topic.all
      if @topics
        render json: @topics
      end
    end

    def show
      @topic = Topic.find(params[:id])

      render json: @topic
    end

    def create
      @topic = current_user.topics.build(topic_params)
      if @topic.save
        render json: @topic
      end
    end

    def update
      if @topic.update(topic_params)
        render json: @topic
      end
    end

    def destroy
      @topic.destroy

      render json: @topic
    end

    protected

    def topic_params
      params.require(:topic).permit(:title, :body)
    end

    def find_my_topic
        @topic = current_user.topics.find(params[:id])
    end
end
