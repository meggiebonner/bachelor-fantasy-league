class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :name
      t.string :email
      t.string :login
      t.string :password
      t.string :paid


      t.timestamps null: false
    end
  end
end
