class CreateAnwsers < ActiveRecord::Migration
  def up
     create_table :answers do |t|
      t.string :content
      t.integer :question_id
      t.boolean :is_correct
      t.timestamps
    end
  end
  def down
    drop_table :answers
  end
end
