class CreateHomeworks < ActiveRecord::Migration[7.2]
  def change
    create_table :homeworks do |t|
      t.timestamps
    end
  end
end
