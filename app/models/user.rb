class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :classroom
  has_many :task_completions, dependent: :destroy
  has_many :completed_tasks, through: :task_completions, source: :task

  def completed?(task)
    task_completions.exists?(task: task)
  end
  
  def complete!(task)
    task_completions.find_or_create_by(task: task)
  end

  def incomplete!(task)
    task_completions.find_by(task_id: task.id)&.destroy
  end
end
