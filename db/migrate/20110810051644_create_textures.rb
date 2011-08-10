class CreateTextures < ActiveRecord::Migration
  def change
    create_table :textures do |t|
      t.string :label
      t.text :body
      t.text :rendered

      t.timestamps
    end
  end
end
