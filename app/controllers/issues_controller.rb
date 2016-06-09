class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :update, :destroy]

  def index
    @issues = Issue.all

    case params[:sort_type]
      when 'id'
        @issues = @issues.order(id: :desc)
      when 'id_reverse'
        @issues = @issues.order(id: :asc)
      when 'updated'
        @issues = @issues.order(updated_at: :desc)
      when 'updated_reverse'
        @issues = @issues.order(updated_at: :asc)
      when 'title'
        @issues = @issues.order(title: :desc)
      when 'title_reverse'
        @issues = @issues.order(title: :asc)
      else
        @issues = @issues.order(updated_at: :desc)
    end

    @issues = @issues.where(status: params[:status]) if params[:status].present?
    @issues = @issues.where(assignee_id: params[:assignee_id]) if params[:assignee_id].present?
    @issues = @issues.with_label(params[:label_ids]) if params[:label_ids].present?

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
    params.require(:issue).permit(:title, :status, :content, :assignee_id, label_ids: [])
  end

  def update_params
    {
      title: issue_params[:title],
      status: Issue.statuses[issue_params[:status]],
      assignee_id: issue_params[:assignee_id],
      label_ids: issue_params[:label_ids],
    }
  end
end
