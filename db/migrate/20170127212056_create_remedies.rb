class CreateRemedies < ActiveRecord::Migration[5.0]
  def change
    create_table :remedies do |t|
      t.integer :user_id, foreign_key: true
      t.integer :solution_id, index: true, foreign_key: true
      t.string :text
      t.timestamps
    end
  end
end
