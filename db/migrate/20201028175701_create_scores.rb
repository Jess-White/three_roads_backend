class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :username
      t.integer :correct
      t.integer :incorrect

      t.timestamps
    end
  end
end
