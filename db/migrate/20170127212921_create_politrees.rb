class CreatePolitrees < ActiveRecord::Migration[5.0]
  def change
    create_table :politrees do |t|
      t.integer :user_id, index: true, foreign_key:true
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
