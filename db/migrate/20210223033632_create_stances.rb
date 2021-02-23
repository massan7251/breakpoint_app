class CreateStances < ActiveRecord::Migration[6.0]
  def change
    create_table :stances do |t|
      t.string :stanceA, null: false
      t.string :stanceB, null: false
      t.timestamps
    end
  end
end
