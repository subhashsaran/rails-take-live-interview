class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :description
      t.integer :user_id
      t.integer :interview_id
      t.string :result_type
      t.string :result_comment

      t.timestamps
    end
  end
end
