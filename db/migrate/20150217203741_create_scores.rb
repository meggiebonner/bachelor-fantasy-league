class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :player
      t.integer :total
      t.integer :week_2
      t.integer :week_3
      t.integer :week_4
      t.integer :week_5
      t.integer :week_6
      t.integer :week_7
      t.integer :week_8
      t.integer :week_9
      t.integer :week_10

      t.timestamps null: false
    end
  end
end
