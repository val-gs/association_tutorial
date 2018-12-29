class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index] # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.tweet_id = params[:tweet_id]
    @comment.save
    redirect_to tweets_path
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:body) # tweetモデルのカラムのみを許可
    end
end
