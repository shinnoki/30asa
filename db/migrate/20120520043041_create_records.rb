class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id
      t.integer :song_id
      t.integer :score

      t.timestamps
    end
  end
end
