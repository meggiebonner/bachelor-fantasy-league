class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :name
      t.string :bachelorette

      t.timestamps null: false
    end
  end
end
