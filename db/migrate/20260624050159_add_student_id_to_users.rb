class AddStudentIdToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :student_id, :string, null: false, default: ""
    add_index :users, :student_id, unique: true
    remove_column :users, :email
  end
end
