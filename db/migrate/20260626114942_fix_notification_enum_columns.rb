class FixNotificationEnumColumns < ActiveRecord::Migration[7.2]
  def up
    change_column_default :notifications, :status, nil
  
    change_column :notifications, :status, :integer,
      using: "CASE status::text WHEN 'draft' THEN 0 WHEN 'published' THEN 1 ELSE 0 END"

    change_column_default :notifications, :status, 0
    change_column_null :notifications, :status, false
  end

  def down
    change_column :notifications, :status, :string, default: "draft"
    change_column :notifications, :notification_type, :string
    change_column :notifications, :target_type, :string
  end
end
