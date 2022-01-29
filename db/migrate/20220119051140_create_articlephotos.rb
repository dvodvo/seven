class CreateArticlephotos < ActiveRecord::Migration[7.0]
  def change
    create_table :articlephotos do |t|
      t.string :name
      t.string :photo
      t.integer :sequence

      t.timestamps
    end
  end
end
