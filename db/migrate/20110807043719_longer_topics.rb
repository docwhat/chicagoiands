class LongerTopics < ActiveRecord::Migration
  def up
    change_table :meetings do |t|
      t.change :topic, :text
    end
  end

  def down
    change_table :meetings do |t|
      t.change :topic, :string
    end
  end
end
