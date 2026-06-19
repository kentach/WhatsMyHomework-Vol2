class VocabularyTestsController < ApplicationController
  def index
    @scores = VocabularyTest.order(test_date: :desc, created_at: :desc)
    @new_score = VocabularyTest.new(test_date: Date.today)
    @homeworks = Homework.where(classroom_id: current_user.classroom_id)
                         .order(created_at: :desc)
  end

  def show
    @score = VocabularyTest.find(params[:id])
  end

  def new 
    VocabularyTest.new
  end

  def create
    @new_score = current_user.vocabulary_tests.build(score_params)
    if @new_score.save
      redirect_to vocabulary_tests_path, notice: "単語テストを新しく記録しました。"
    else
      @scores = VocabularyTest.order(test_date: :desc, created_at: :desc)
      @homeworks = Homework.where(classroom_id: current_user.classroom_id)
                           .order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @score = VocabularyTest.find(params[:id])
    @score.destroy!
    redirect_to vocabulary_tests_path, notice: "記録を削除しました。"
  end

  private

  def score_params
    params.require(:vocabulary_test).permit(:vocabulary_score, :sentence_score, :test_date, :homework_id)
  end
end
