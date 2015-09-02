class CreateSelectedOptions < ActiveRecord::Migration
  def change
    create_table :selected_options do |t|
      t.integer :option_id
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
