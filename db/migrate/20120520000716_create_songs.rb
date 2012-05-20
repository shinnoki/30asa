class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :level
      t.integer :ver
      t.integer :notes

      t.timestamps
    end
  end
end
