class ChangeMembershipsColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :memberships, :user_id, :member_id
  end
end
