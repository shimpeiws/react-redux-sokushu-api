class IssueCommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_issue
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = Comment.new(issue_params)

    unless @comment.save
      return render json: @issue.errors, status: :unprocessable_entity
    end

    render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
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
    @comment = @issue.comment.find(comment_params[:id])
    render nothing: true, status: :unprocessable_entity unless @comment.present?
  end
end
