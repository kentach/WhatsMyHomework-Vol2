class ChangeNotificationTypeToInteger < ActiveRecord::Migration[7.2]
  def up
    change_column :notifications, :notification_type, :integer,
      using: "notification_type::integer", default: 0, null: false
    change_column :notifications, :target_type, :integer,
      using: "target_type::integer", default: 0, null: false
  end
  
  def down
    change_column :notifications, :notification_type, :string,
      default: "0", null: false
    change_column :notifications, :target_type, :string,
      default: "0", null: false
  end
end
