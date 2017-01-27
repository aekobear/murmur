class AddPolitreeIdToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :politree_id, :integer, index: true, foreign_key: true
  end
end
