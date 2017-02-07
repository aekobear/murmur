class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :politrees, :user_id, :owner_id
  end
end
