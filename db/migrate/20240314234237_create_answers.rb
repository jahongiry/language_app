class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :multiple_question, null: false, foreign_key: true
      t.text :content
      t.boolean :correct

      t.timestamps
    end
  end
end
