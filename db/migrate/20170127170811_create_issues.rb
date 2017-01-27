class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.string :topic
      t.string :description

      t.timestamps
    end
  end
end
