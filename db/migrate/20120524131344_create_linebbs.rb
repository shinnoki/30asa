class CreateLinebbs < ActiveRecord::Migration
  def change
    create_table :linebbs do |t|
      t.string :author
      t.string :text

      t.timestamps
    end
  end
end
