class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    base_date = params[:week].present? ? Date.parse(params[:week]) : Date.today
    # 値が入っていればその日付を使い、入っていなければ今日の日付を使う

    week_start = base_date.beginning_of_week(:monday) # beginning_of_week = 週の開始日を返すメソッド
    week_end   = week_start + 6.days

    @week_days = (week_start..week_end).to_a
    @prev_week = week_start - 7.days
    @next_week = week_start + 7.days

    @selected_date =
      if params[:date].present?
        Date.parse(params[:date])
      elsif @week_days.include?(Date.today)
        Date.today
      else
        week_start
      end

    return redirect_to(root_path, alert: "所属クラスが設定されていません") unless current_user.classroom

    @homeworks = current_user.classroom.homeworks.includes(:tasks)
                            .where(
                              "test_start_date <= ? AND test_end_date >= ?",
                              @selected_date,
                              @selected_date
                            )
                            .order(:test_end_date)
  end
end