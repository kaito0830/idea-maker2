class AddIndexToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_index :ideas, :title, length: 32
  end
end
