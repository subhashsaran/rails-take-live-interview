class CreateOptions < ActiveRecord::Migration
  def up
    create_table :options do |t|
      t.string   :content
      t.boolean  :is_correct
      t.integer  :question_id
      t.integer  :user_id
      t.timestamps
    end
  end
  def down
    drop_table :options
  end
end
