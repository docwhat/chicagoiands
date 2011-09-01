class AddHasDvdToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :has_dvd, :boolean, :default => false, :null => false
  end
end
