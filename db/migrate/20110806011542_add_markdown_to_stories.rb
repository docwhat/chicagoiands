class AddMarkdownToStories < ActiveRecord::Migration
 def up
   add_column :stories, :rendered, :string
 end

 def down
   remove_column :stories, :rendered
 end
end
