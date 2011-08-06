class ChangeBodyToText < ActiveRecord::Migration
  def up
    change_column :meetings, :body, :text
    change_column :stories, :body, :text
  end

  def down
    change_column :meetings, :body, :string
    change_column :stories, :body, :string
  end
end
