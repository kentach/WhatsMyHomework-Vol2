class Admin::DashboardController < Admin::BaseController
  def index
    @published_homeworks = Homework.published
    @draft_homeworks = Homework.draft
    @classrooms = Classroom.order(created_at: :asc)
    @recent_homeworks = Homework.order(updated_at: :desc).limit(10)
  end
end
