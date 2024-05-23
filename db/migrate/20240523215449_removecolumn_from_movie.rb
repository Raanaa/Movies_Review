class RemovecolumnFromMovie < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :filming_location, :string
  end
end
