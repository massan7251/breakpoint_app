class CreateStances < ActiveRecord::Migration[6.0]
  def change
    create_table :stances do |t|
      t.integer :select_stance
      t.timestamps
    end
  end
end
