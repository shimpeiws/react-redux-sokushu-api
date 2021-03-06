class IssueCommentsController < ApplicationController
  before_action :set_issue
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = @issue.comments.new(comment_params)

    unless @comment.save
      return render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end

    render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_name, :content)
  end

  def set_issue
    @issue = Issue.find(params[:issue_id])
    render nothing: true, status: :not_found unless @issue.present?
  end

  def set_comment
    @comment = @issue.comments.find(params[:comment_id])
    render nothing: true, status: :unprocessable_entity unless @comment.present?
  end
end
