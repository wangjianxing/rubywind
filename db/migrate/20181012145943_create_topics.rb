class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.integer :replies_count
      t.datetime :deleted_at
      t.datetime :closed_at

      t.timestamps
    end
  end
end
