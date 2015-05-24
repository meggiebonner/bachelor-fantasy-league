class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.string :player
      t.integer :round
      t.string :bachelor

      t.timestamps null: false
    end
  end
end
