class AddPublicfieldToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :public, :boolean, default: false
  end
end
