class AddMeetingsRendered < ActiveRecord::Migration
  def up
    add_column :meetings, :rendered, :text
  end

  def down
    remove_column :meetings, :rendered
  end
end
