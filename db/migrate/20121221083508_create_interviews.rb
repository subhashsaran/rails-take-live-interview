class CreateInterviews < ActiveRecord::Migration
  def change
     create_table :interviews do |t|
      t.string :title
      t.integer :user_id
      t.decimal :time_test, :precision => 4, :scale => 2
      t.datetime :start_date
      t.datetime :due_date

      t.timestamps
    end
  end
end
