class CreateAskQuestions < ActiveRecord::Migration
  def change
    create_table :ask_questions do |t|
      t.string :title
      t.text :body
      t.boolean :resolved

      t.timestamps null: false
    end
  end
end
