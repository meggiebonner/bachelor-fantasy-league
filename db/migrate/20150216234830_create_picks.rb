class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :player
      t.string :week
      t.string :rose
      t.string :tears

      t.timestamps null: false
    end
  end
end
