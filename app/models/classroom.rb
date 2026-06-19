class Classroom < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :homeworks, dependent: :destroy
end
