class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :update, :destroy]

  def index
    @issues = Issue.all.order('updated_at DESC')

    render json: @issues
  end

  def show
    render json: @issue
  end

  def create
    @issue = Issue.new(issue_params)

    unless @issue.save
      return render json: { errors: @issue.errors.full_messages }, status: :unprocessable_entity
    end

    render json: @issue
  end

  def update
    if @issue.update(update_params)
      render json: @issue
    else
      render json: { errors: @issue.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @issue.destroy
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :status)
  end

  def update_params
    {
      title: issue_params[:title],
      status: Issue.statuses[issue_params[:status]]
    }
  end
end
