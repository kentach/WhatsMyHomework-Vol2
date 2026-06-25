class Admin::DashboardController < Admin::BaseController
  def index
    @published_homeworks = Homework.where.published
    @draft_homeworks = Homework.where.draft
    @classrooms = Classroom.order(created_at: :asc)
    @recent_homeworks = Homework.order(updated_at: :desc).limit(10)
  end
end
