class RepliesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :find_my_reply, only: [:update, :destroy]

  def index
    @replies = Topic.find(params[:topic_id]).replies
    
    if @replies
        render json: @replies
    end
  end

  def show
    @reply = Reply.find(params[:id])

    render json: @reply
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.replies.build(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      render json: @reply
    end
  end

  def update
    if @reply.update(reply_params)
        render json: @reply
      end
  end

  def destroy
    @reply.destroy

    render json: @reply
  end

  protected
  def reply_params
    params.require(:reply).permit(:body, :topic_id)
  end

  def find_my_reply
      @reply = current_user.replies.find(params[:id])
  end
end
