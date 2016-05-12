class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :d_name
      t.integer :role

      t.timestamps null: false
    end
  end
end
