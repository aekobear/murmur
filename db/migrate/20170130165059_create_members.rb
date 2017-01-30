class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.integer :politree_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end
