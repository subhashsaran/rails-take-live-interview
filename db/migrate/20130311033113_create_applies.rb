class CreateApplies < ActiveRecord::Migration
  def up
    create_table :applies do |t|
      t.integer :interview_id
      t.integer :user_id
      t.timestamps
    end
  end
  def down
     drop_table :applies
  end
end
