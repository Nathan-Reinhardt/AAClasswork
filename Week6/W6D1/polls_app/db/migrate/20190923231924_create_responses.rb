class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :question_id, :user_id, :answer_choice_id, null: false
      t.timestamps
    end
    
  end
end
