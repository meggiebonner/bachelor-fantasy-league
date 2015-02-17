class CreateBachelorettes < ActiveRecord::Migration
  def change
    create_table :bachelorettes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
