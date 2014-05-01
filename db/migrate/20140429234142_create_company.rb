class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text :link, null: false

      t.timestamps
    end
  end
end
