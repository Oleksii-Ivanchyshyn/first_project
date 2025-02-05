class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
