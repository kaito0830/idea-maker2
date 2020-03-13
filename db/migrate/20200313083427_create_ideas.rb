class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :info
      t.integer :value
      t.timestamps
    end
  end
end
