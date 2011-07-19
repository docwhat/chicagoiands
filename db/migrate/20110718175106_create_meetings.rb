class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :topic
      t.text :body
      t.date :date

      t.timestamps
    end
  end
end
