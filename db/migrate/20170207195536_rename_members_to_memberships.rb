class RenameMembersToMemberships < ActiveRecord::Migration[5.0]
  def change
    rename_table :members, :memberships
  end
end
