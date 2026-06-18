class HomeworksController < ApplicationController
  def index
    @classrooms = Classroom.all #タブ作成
    @homeworks = Homework.includes(:classroom) #宿題一覧の表示
    @selected_classroom = Classroom.find_by(id: params[:id])
    if @selected_classroom
      @homeworks = @homework.where(classroom_id: @selected_classroom.id)
    end
  end
end
