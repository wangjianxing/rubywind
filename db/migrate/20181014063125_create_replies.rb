class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :topic_id, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
