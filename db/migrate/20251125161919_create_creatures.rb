class CreateCreatures < ActiveRecord::Migration[8.1]
  def change
    create_table :creatures do |t|
      t.string :name

      t.timestamps
    end
  end
end
