class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.string   :content
      t.string   :question_type
      t.string   :solution
      t.integer  :interview_id
      t.integer  :user_id
      t.timestamps
    end
  end
  def down
    drop_table :questions
  end
end
